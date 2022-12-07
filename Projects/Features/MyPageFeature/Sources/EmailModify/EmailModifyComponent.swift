import NeedleFoundation
import DomainModule
import SwiftUI

public protocol EmailModifyDependency: Dependency {
    var emailVerifyComponent: EmailVerifyComponent { get }
    var sendAuthCodeUseCase: any SendAuthCodeUseCase { get }
}

public final class EmailModifyComponent: Component<EmailModifyDependency> {
    public func makeView() -> some View {
        EmailModifyView(
            viewModel: .init(sendAuthCodeUseCase: dependency.sendAuthCodeUseCase),
            emailVerifyComponent: dependency.emailVerifyComponent
        )
    }
}
