import DomainModule
import NeedleFoundation
import SwiftUI

public protocol WriteHolidayDependency: Dependency {}

public final class WriteHolidayComponent: Component<WriteHolidayDependency> {
    public func makeView(
        holidaysDict: Binding<[String: HolidayType]>,
        scheduleDict: Binding<[String: [ScheduleEntity]]>,
        isPresented: Binding<Bool>,
        calendarAnimation: Namespace.ID
    ) -> some View {
        WriteHolidayView(
            viewModel: .init(
                holidaysDict: holidaysDict,
                scheduleDict: scheduleDict
            ),
            isPresented: isPresented,
            calendarAnimation: calendarAnimation
        )
    }
}
