import DomainModule
import SwiftUI
import NeedleFoundation

public protocol ComposeScheduleDependency: Dependency {
    var createNewScheduleUseCase: any CreateNewScheduleUseCase { get }
    var updateScheduleUseCase: any UpdateScheduleUseCase { get }
}

public final class ComposeScheduleComponent: Component<ComposeScheduleDependency> {
    public func makeView(
        selectedDate: Date? = nil,
        updateTarget: ScheduleEntity? = nil,
        completion: (() -> Void)? = {}
    ) -> some View {
        ComposeScheduleView(
            viewModel: .init(
                selectedDate: selectedDate,
                updateTarget: updateTarget,
                createNewScheduleUseCase: dependency.createNewScheduleUseCase,
                updateScheduleUseCase: dependency.updateScheduleUseCase
            ),
            completion: completion
        )
    }
}
