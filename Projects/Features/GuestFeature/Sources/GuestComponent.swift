import DomainModule
import SwiftUI
import NeedleFoundation

public protocol GuestDependency: Dependency {
    var fetchPublicMenuListUseCase: any FetchPublicMenuListUseCase { get }
}

public final class GuestComponent: Component<GuestDependency> {
    public func makeView() -> some View {
        if #available(iOS 16.0, *) {
            return NavigationStack {
                GuestView(
                    viewModel: .init(
                        fetchPublicMenuListUseCase: dependency.fetchPublicMenuListUseCase
                    )
                )
            }
        } else {
            return NavigationView {
                GuestView(
                    viewModel: .init(
                        fetchPublicMenuListUseCase: dependency.fetchPublicMenuListUseCase
                    )
                )
            }
            .navigationViewStyle(.stack)
        }
    }
}
