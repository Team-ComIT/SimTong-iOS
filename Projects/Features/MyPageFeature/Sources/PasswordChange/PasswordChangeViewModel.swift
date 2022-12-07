import Combine
import BaseFeature
import Utility
import DomainModule

final class PasswordChangeViewModel: BaseViewModel {
    private let changePasswordUseCase: any ChangePasswordUseCase
    @Published var newPassword = "" {
        didSet { isError = false }
    }
    @Published var confirmPassword = "" {
        didSet { isError = false }
    }
    @Published var isSuccessPasswordChange = false
    @Published var isNavigateFindPassword = false
    @Published var isCheckPasswordStep = false
    private let password: String

    var isEnableChangeButton: Bool {
        !newPassword.isEmpty && (!confirmPassword.isEmpty || !isCheckPasswordStep)
    }

    init(
        changePasswordUseCase: any ChangePasswordUseCase,
        password: String
    ) {
        self.changePasswordUseCase = changePasswordUseCase
        self.password = password
    }

    @MainActor
    func changeButtonDidTap() {
        isCheckPasswordStep = true
        if checkPassword() {
            Task {
                await withAsyncTry(with: self) { owner in
                    try await owner.changePasswordUseCase.execute(
                        req: .init(
                            password: owner.password,
                            newPassword: owner.newPassword
                        )
                    )
                    owner.isSuccessPasswordChange = true
                }
            }
        }
    }

    func checkPassword() -> Bool {
        let passwordPattern = "^(?=.*[A-Za-z])(?=.*[0-9])(?=.*[$_+-]).{8,20}"
        guard newPassword ~= passwordPattern else {
            isError = true
            errorMessage = "비밀번호는 8~20자이고 영문, 숫자, 특수기호($+-_)가 모두 포함되어야합니다."
            return false
        }

        if newPassword == confirmPassword {
            print(newPassword, confirmPassword)
            return true
        } else {
            isError = true
            errorMessage = "비밀번호가 일치하지 않습니다."
            return false
        }
    }
}
