import DomainModule
import NeedleFoundation
import SwiftUI

public protocol SignupInfoDependency: Dependency {
    var checkDuplicateNicknameUseCase: any CheckDuplicateNicknameUseCase { get }
    var uploadSingleFileUseCase: any UploadSingleFileUseCase { get }
    var signupUseCase: any SignupUseCase { get }
}

public final class SignupInfoComponent: Component<SignupInfoDependency> {
    public func makeView(signupInfoSceneParam: SignupInfoSceneParam) -> some View {
        SignupInfoView(
            viewModel: SignupInfoViewModel(
                signupInfoSceneParam: signupInfoSceneParam,
                checkDuplicateNicknameUseCase: dependency.checkDuplicateNicknameUseCase,
                uploadSingleFileUseCase: dependency.uploadSingleFileUseCase,
                signupUseCase: dependency.signupUseCase
            )
        )
    }
}
