import DomainModule
import NeedleFoundation
import SwiftUI

public protocol WriteHolidayDependency: Dependency {}

public final class WriteHolidayComponent: Component<WriteHolidayDependency> {
    public func makeView(
        holidaysDict: [String: HolidayType],
        scheduleDict: [String: [ScheduleEntity]],
        isPresented: Binding<Bool>,
        calendarAnimation: Namespace.ID,
        onFinished: @escaping (
            [String: HolidayType],
            [String: [ScheduleEntity]]
        ) -> Void
    ) -> some View {
        WriteHolidayView(
            viewModel: .init(
                holidaysDict: holidaysDict,
                scheduleDict: scheduleDict
            ),
            isPresented: isPresented,
            calendarAnimation: calendarAnimation,
            onFinished: onFinished
        )
    }
}
