import BaseFeature
import Combine
import DomainModule
import Foundation
import Utility

final class ScheduleCalendarViewModel: BaseViewModel {
    @Published var holidaysDict: [String: HolidayType]
    @Published var scheduleDict: [String: [ScheduleEntity]]
    @Published var selectedDate: Date?
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

    init(
        holidaysDict: [String: HolidayType],
        scheduleDict: [String: [ScheduleEntity]]
    ) {
        self.holidaysDict = holidaysDict
        self.scheduleDict = scheduleDict
    }

    func dateOnTap(date: Date) {
        if selectedDate == date {
            selectedDate = nil
        } else {
            selectedDate = date
        }
    }
}

extension Sequence where Iterator.Element: Hashable {
    func unique() -> [Iterator.Element] {
        var seen: Set<Iterator.Element> = []
        return filter { seen.insert($0).inserted }
    }
}
