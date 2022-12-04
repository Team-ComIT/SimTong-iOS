import DomainModule
import NeedleFoundation
import SwiftUI

public protocol MyPageDependency: Dependency {
    var fetchMyProfileUseCase: any FetchMyProfileUseCase { get }
    var nicknameChangeComponent: NicknameChangeComponent { get }
    var emailModifyComponent: EmailModifyComponent { get }
    var spotChangeComponent: SpotChangeComponent { get }
    var passwordChangeComponent: PasswordChangeComponent { get }
}

public final class MyPageComponent: Component<MyPageDependency> {
    public func makeView() -> some View {
        MyPageView(
            viewModel: .init(
                fetchMyProfileUseCase: dependency.fetchMyProfileUseCase
            ),
            nicknameChangeComponent: dependency.nicknameChangeComponent,
            emailModifyComponent: dependency.emailModifyComponent,
            spotChangeComponent: dependency.spotChangeComponent,
            passwordChangeComponent: dependency.passwordChangeComponent
        )
    }
}
