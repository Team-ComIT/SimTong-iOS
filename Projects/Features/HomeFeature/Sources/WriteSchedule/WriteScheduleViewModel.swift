import BaseFeature
import Combine
import DomainModule
import Foundation

final class WriteScheduleViewModel: BaseViewModel {
    @Published var holidaysDict: [String: HolidayType]
    @Published var scheduleDict: [String: [ScheduleEntity]]
    @Published var selectedDate = Date()

    init(
        holidaysDict: [String: HolidayType],
        scheduleDict: [String: [ScheduleEntity]]
    ) {
        self.holidaysDict = holidaysDict
        self.scheduleDict = scheduleDict
    }
}
