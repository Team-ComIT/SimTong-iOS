import DomainModule
import SwiftUI
import NeedleFoundation

public protocol WriteScheduleDependency: Dependency {}

public final class WriteScheduleComponent: Component<WriteScheduleDependency> {
    public func makeView(
        holidaysDict: [String: HolidayType],
        scheduleDict: [String: [ScheduleEntity]],
        isPresented: Binding<Bool>,
        scheduleAnimation: Namespace.ID,
        onFinished: @escaping (
            [String: HolidayType],
            [String: [ScheduleEntity]]
        ) -> Void
    ) -> some View {
        WriteScheduleView(
            viewModel: .init(
                holidaysDict: holidaysDict,
                scheduleDict: scheduleDict
            ),
            isPresented: isPresented,
            scheduleAnimation: scheduleAnimation,
            onFinished: onFinished
        )
    }
}
