import BaseFeature
import Combine
import DomainModule
import SwiftUI
import Utility

final class WriteHolidayViewModel: BaseViewModel {
    @Published var currentMonth = Date()
    @Published var holidaysDict: [String: HolidayType]
    @Published var scheduleDict: [String: [ScheduleEntity]]
    @Published var selectedDate = Date()
    @Published var annualCount = 0
    @Published var isPresentedCheckSendHolidays = false

    private let fetchHolidayUseCase: any FetchHolidayUseCase
    private let setHolidayUseCase: any SetHolidayUseCase
    private let setAnnualUseCase: any SetAnnualUseCase
    private let setWorkUseCase: any SetWorkUseCase
    private let fetchAnnualCountUseCase: any FetchAnnualCountUseCase

    var selectedDateHolidayText: String {
        "\(selectedDate.year)년 \(selectedDate.month)월 \(selectedDate.day)일은" +
        "\"\((holidaysDict[selectedDate.toSmallSimtongDateString()] ?? .work).display)\"입니다."
    }

    init(
        holidaysDict: [String: HolidayType],
        scheduleDict: [String: [ScheduleEntity]],
        fetchHolidayUseCase: any FetchHolidayUseCase,
        setHolidayUseCase: any SetHolidayUseCase,
        setAnnualUseCase: any SetAnnualUseCase,
        setWorkUseCase: any SetWorkUseCase,
        fetchAnnualCountUseCase: any FetchAnnualCountUseCase
    ) {
        self.holidaysDict = holidaysDict
        self.scheduleDict = scheduleDict
        self.fetchHolidayUseCase = fetchHolidayUseCase
        self.setHolidayUseCase = setHolidayUseCase
        self.setAnnualUseCase = setAnnualUseCase
        self.setWorkUseCase = setWorkUseCase
        self.fetchAnnualCountUseCase = fetchAnnualCountUseCase
    }

    @MainActor
    func onAppear() {
        Task {
            await withAsyncTry(with: self) { owner in
                let annualCount = try await owner.fetchAnnualCountUseCase.execute(year: owner.currentMonth.year)
                owner.annualCount = annualCount
            }
        }
    }

    @MainActor
    func writeHoliday(type: HolidayType) {
        let thisWeek = selectedDate.fetchAllDatesInCurrentWeek()
        if type == .dayoff && thisWeek.filter({ holidaysDict[$0.toSmallSimtongDateString()] == .dayoff }).count >= 2 {
            errorMessage = "일주일 최대 2회만 휴무 정보를 등록할 수 있습니다"
            isError = true
        } else {
            Task {
                await withAsyncTry(with: self) { owner in
                    switch type {
                    case .dayoff:
                        try await owner.setHolidayUseCase.execute(date: owner.selectedDate.toSmallSimtongDateString())

                    case .annual:
                        try await owner.setAnnualUseCase.execute(date: owner.selectedDate.toSmallSimtongDateString())

                    case .work:
                        try await owner.setWorkUseCase.execute(date: owner.selectedDate.toSmallSimtongDateString())
                    }
                    owner.holidaysDict[owner.selectedDate.toSmallSimtongDateString()] = type
                }
            }
        }
    }

    func holidaySendButtonDidTap() {
        isPresentedCheckSendHolidays = true
    }

    @MainActor
    func confirmHolidaySendButtonDidTap() {
        Task {
            
        }
    }
}
