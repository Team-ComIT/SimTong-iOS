import BaseFeature
import Combine
import DomainModule
import Utility

public final class RenewalPasswordViewModel: BaseViewModel {
    @Published var password = "" {
        didSet { isError = false }
    }
    @Published var passwordCheck = "" {
        didSet { isError = false }
    }
    @Published var isSuccessRenewal = false

    private let resetPasswordUseCase: any ResetPasswordUseCase
    let renewalPasswordSceneParam: RenewalPasswordSceneParam

    public init(
        resetPasswordUseCase: any ResetPasswordUseCase,
        renewalPasswordSceneParam: RenewalPasswordSceneParam
    ) {
        self.resetPasswordUseCase = resetPasswordUseCase
        self.renewalPasswordSceneParam = renewalPasswordSceneParam
    }

    @MainActor
    func completeButtonDidTap() {
        let passwordPattern = "(?=.*[A-Za-z])(?=.*\\d)(?=^[\\w$+-]{8,20}$).*"
        guard password ~= passwordPattern else {
            isError = true
            errorMessage = "비밀번호는 8~20자이고 영문, 숫자, 특수기호($+-_)가 모두 포함되어야합니다."
            return
        }

        if password == passwordCheck {
            Task {
                await withAsyncTry(with: self) { owner in
                    try await owner.resetPasswordUseCase.execute(req: .init(
                        email: owner.renewalPasswordSceneParam.email,
                        employeeNumber: Int(owner.renewalPasswordSceneParam.employeeID) ?? 0,
                        newPassword: owner.password)
                    )
                }
            }
            isSuccessRenewal = true
        } else {
            isError = true
            errorMessage = "비밀번호가 일치하지 않습니다."
        }
    }
}
