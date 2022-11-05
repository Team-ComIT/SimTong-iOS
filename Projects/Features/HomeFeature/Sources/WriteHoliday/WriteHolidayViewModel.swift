import BaseFeature
import Combine
import DomainModule
import SwiftUI
import Utility

final class WriteHolidayViewModel: BaseViewModel {
    @Binding var holidaysDict: [String: HolidayType]
    @Binding var scheduleDict: [String: [ScheduleEntity]]
    @Published var selectedDate = Date()
    var selectedDateHolidayText: String {
        "\(selectedDate.year)년 \(selectedDate.month)월 \(selectedDate.day)일은" +
        "\"\((holidaysDict[selectedDate.toSmallSimtongDateString()] ?? .work).display)\"입니다."
    }

    init(
        holidaysDict: Binding<[String: HolidayType]>,
        scheduleDict: Binding<[String: [ScheduleEntity]]>
    ) {
        _holidaysDict = holidaysDict
        _scheduleDict = scheduleDict
    }
}
