import BaseFeature
import Combine
import DomainModule
import SwiftUI

final class WriteHolidayViewModel: BaseViewModel {
    @Binding var holidaysDict: [String: HolidayType]
    @Binding var scheduleDict: [String: [ScheduleEntity]]

    init(
        holidaysDict: Binding<[String: HolidayType]>,
        scheduleDict: Binding<[String: [ScheduleEntity]]>
    ) {
        _holidaysDict = holidaysDict
        _scheduleDict = scheduleDict
    }
}
