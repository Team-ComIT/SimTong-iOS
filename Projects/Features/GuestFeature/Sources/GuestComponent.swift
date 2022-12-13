import SwiftUI
import NeedleFoundation

public protocol GuestDependency: Dependency {}

public final class GuestComponent: Component<GuestDependency> {
    public func makeView() -> some View {
        if #available(iOS 16.0, *) {
            return NavigationStack {
                GuestView(
                    viewModel: .init()
                )
            }
        } else {
            return NavigationView {
                GuestView(
                    viewModel: .init()
                )
            }
            .navigationViewStyle(.stack)
        }
    }
}
