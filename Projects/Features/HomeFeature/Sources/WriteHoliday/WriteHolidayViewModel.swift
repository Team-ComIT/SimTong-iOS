import BaseFeature
import Combine
import DomainModule
import SwiftUI
import Utility

final class WriteHolidayViewModel: BaseViewModel {
    @Published var holidaysDict: [String: HolidayType]
    @Published var scheduleDict: [String: [ScheduleEntity]]
    @Published var selectedDate = Date()
    @Published var errorSubMessage = ""

    var selectedDateHolidayText: String {
        "\(selectedDate.year)년 \(selectedDate.month)월 \(selectedDate.day)일은" +
        "\"\((holidaysDict[selectedDate.toSmallSimtongDateString()] ?? .work).display)\"입니다."
    }

    init(
        holidaysDict: [String: HolidayType],
        scheduleDict: [String: [ScheduleEntity]]
    ) {
        self.holidaysDict = holidaysDict
        self.scheduleDict = scheduleDict
    }

    func writeHoliday(type: HolidayType) {
        let thisWeek = selectedDate.fetchAllDatesInCurrentWeek()
        if type == .annual, thisWeek.filter { holidaysDict[$0.toSmallSimtongDateString()] == .annual }.count >= 2 {
            errorMessage = "주간 휴무 정보 불일치"
            errorSubMessage = "일주일 최대 2회 휴무 정보를\n등록할 수 있습니다."
            isError = true
        } else {
            holidaysDict[selectedDate.toSmallSimtongDateString()] = type
        }
    }
}
