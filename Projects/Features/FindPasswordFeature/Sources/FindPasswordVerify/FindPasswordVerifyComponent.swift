import DomainModule
import NeedleFoundation
import SwiftUI

public protocol FindPasswordVerifyDependency: Dependency {
    var sendAuthCodeUseCase: any SendAuthCodeUseCase { get }
    var verifyAuthCodeUseCase: any VerifyAuthCodeUseCase { get }
    var renewalPasswordComponent: RenewalPasswordComponent { get }
}

public final class FindPasswordVerifyComponent: Component<FindPasswordVerifyDependency> {
    public func makeView(findPasswordVerifySceneParam: FindPasswordVerifySceneParam) -> some View {
        FindPasswordVerifyVIew(
            viewModel: .init(
                sendAuthCodeUseCase: dependency.sendAuthCodeUseCase,
                verifyAuthCodeUseCase: dependency.verifyAuthCodeUseCase,
                findPasswordVerifySceneParam: findPasswordVerifySceneParam
            ),
            renewalPasswordComponent: dependency.renewalPasswordComponent
        )
    }
}
