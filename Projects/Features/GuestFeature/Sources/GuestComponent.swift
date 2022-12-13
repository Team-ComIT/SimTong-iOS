import SwiftUI
import NeedleFoundation

public protocol GuestDependency: Dependency {}

public final class GuestComponent: Component<GuestDependency> {
    public func makeView() -> some View {
        GuestView(
            viewModel: .init()
        )
    }
}

