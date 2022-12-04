import DomainModule
import NeedleFoundation
import SwiftUI

public protocol MyPageDependency: Dependency {
    var fetchMyProfileUseCase: any FetchMyProfileUseCase { get }
    var nicknameModifyComponent: NicknameModifyComponent { get }
    var emailModifyComponent: EmailModifyComponent { get }
    var spotChangeComponent: SpotChangeComponent { get }
}

public final class MyPageComponent: Component<MyPageDependency> {
    public func makeView() -> some View {
        MyPageView(
            viewModel: .init(
                fetchMyProfileUseCase: dependency.fetchMyProfileUseCase
            ),
            nicknameModifyComponent: dependency.nicknameModifyComponent,
            emailModifyComponent: dependency.emailModifyComponent,
            spotChangeComponent: dependency.spotChangeComponent
        )
    }
}
