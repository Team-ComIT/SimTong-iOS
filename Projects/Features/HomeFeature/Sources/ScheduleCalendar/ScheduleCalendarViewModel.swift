import BaseFeature
import Combine
import DomainModule
import Foundation
import Utility

final class ScheduleCalendarViewModel: BaseViewModel {
    @Published var isPresentedScheduleOptionPicker = false
    @Published var isPresentedScheduleDeleteConfirm = false
    @Published var isNavigateUpdateSchedule = false
    @Published var holidaysDict: [String: HolidayType]
    @Published var scheduleDict: [String: [ScheduleEntity]]
    @Published var selectedDate: Date?
    @Published var selectedSchedule: ScheduleEntity?
    var filteredScheduleList: [ScheduleEntity] {
        let list: [String: [ScheduleEntity]]
        if let selectedDate {
            list = scheduleDict.filter { selectedDate.isSameDay($0.key.toSmallSimtongDate()) }
        } else {
            list = scheduleDict
        }
        return list.sorted {
            $0.key.toSmallSimtongDate().compare($1.key.toSmallSimtongDate()) == .orderedDescending ||
            $0.key.toSmallSimtongDate().compare($1.key.toSmallSimtongDate()) == .orderedSame
        }
        .reduce(into: [ScheduleEntity]()) { partialResult, dict in
            partialResult.append(contentsOf: dict.value)
        }
        .unique()
    }
    private let deleteScheduleUseCase: any DeleteScheduleUseCase
    private let fetchScheduleUseCase: any FetchScheduleUseCase

    init(
        holidaysDict: [String: HolidayType],
        scheduleDict: [String: [ScheduleEntity]],
        deleteScheduleUseCase: any DeleteScheduleUseCase,
        fetchScheduleUseCase: any FetchScheduleUseCase
    ) {
        self.holidaysDict = holidaysDict
        self.scheduleDict = scheduleDict
        self.deleteScheduleUseCase = deleteScheduleUseCase
        self.fetchScheduleUseCase = fetchScheduleUseCase
    }

    func dateOnTap(date: Date) {
        if selectedDate == date {
            selectedDate = nil
        } else {
            selectedDate = date
        }
    }

    func scheduleOptionButtonDidTap(schedule: ScheduleEntity) {
        selectedSchedule = schedule
        isPresentedScheduleOptionPicker = true
    }

    func scheduleUpdateButtonDidTap() {
        isPresentedScheduleOptionPicker = false
        if selectedSchedule != nil {
            isNavigateUpdateSchedule = true
        }
    }

    func scheduleDeleteButtonDidTap() {
        isPresentedScheduleOptionPicker = false
        isPresentedScheduleDeleteConfirm = true
    }

    func scheduleDeleteConfirmButtonDidTap() {
        Task {
            await withAsyncTry(with: self) { owner in
                guard let selectedSchedule = owner.selectedSchedule else { return }
                try await owner.deleteScheduleUseCase.execute(id: selectedSchedule.id)
                owner.isPresentedScheduleDeleteConfirm = false
                let schedules = try await owner.fetchScheduleUseCase.execute(date: Date())
                for schedule in schedules {
                    var start = schedule.startAt.toSmallSimtongDate()
                    let end = schedule.endAt.toSmallSimtongDate().adding(by: .day, value: 1)
                    if owner.scheduleDict[schedule.startAt] == nil {
                        owner.scheduleDict[schedule.startAt] = [schedule]
                    } else {
                        owner.scheduleDict[schedule.startAt]?.append(schedule)
                    }
                    start = start.adding(by: .day, value: 1)
                    while !start.isSameDay(end) {
                        if owner.scheduleDict[start.toSmallSimtongDateString()] == nil {
                            owner.scheduleDict[start.toSmallSimtongDateString()] = [schedule]
                        } else {
                            owner.scheduleDict[start.toSmallSimtongDateString()]?.append(schedule)
                        }

                        start = start.adding(by: .day, value: 1)
                    }
                }
            }
        }
    }
}

extension Sequence where Iterator.Element: Hashable {
    func unique() -> [Iterator.Element] {
        var seen: Set<Iterator.Element> = []
        return filter { seen.insert($0).inserted }
    }
}