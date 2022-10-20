import DomainModule
import NeedleFoundation
import SwiftUI

public protocol MyPageDepenedency: Dependency {
    var fetchMyProfileUseCase: any FetchMyProfileUseCase { get }
}

public final class MyPageComponent: Component<MyPageDepenedency> {
    public func makeView() -> some View {
        MyPageView(
            viewModel: .init(
                fetchMyProfileUseCase: dependency.fetchMyProfileUseCase
            )
        )
    }
}
