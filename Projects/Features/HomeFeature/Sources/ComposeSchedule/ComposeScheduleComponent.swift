import SwiftUI
import NeedleFoundation

public protocol ComposeScheduleDependency: Dependency {}

public final class ComposeScheduleComponent: Component<ComposeScheduleDependency> {
    public func makeView() -> some View {
        ComposeScheduleView(
            viewModel: .init()
        )
    }
}
