import DomainModule
import SwiftUI
import NeedleFoundation

public protocol ScheduleCalendarDependency: Dependency {
    var composeScheduleComponent: ComposeScheduleComponent { get }
    var deleteScheduleUseCase: any DeleteScheduleUseCase { get }
    var fetchScheduleUseCase: any FetchScheduleUseCase { get }
}

public final class ScheduleCalendarComponent: Component<ScheduleCalendarDependency> {
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
        ScheduleCalendarView(
            viewModel: .init(
                holidaysDict: holidaysDict,
                scheduleDict: scheduleDict,
                deleteScheduleUseCase: dependency.deleteScheduleUseCase,
                fetchScheduleUseCase: dependency.fetchScheduleUseCase
            ),
            isPresented: isPresented,
            scheduleAnimation: scheduleAnimation,
            onFinished: onFinished,
            composeScheduleComponent: dependency.composeScheduleComponent
        )
    }
}
