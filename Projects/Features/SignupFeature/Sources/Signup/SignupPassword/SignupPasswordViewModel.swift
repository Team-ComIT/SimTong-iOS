import Combine
import BaseFeature

final class SignupPasswordViewModel: BaseViewModel {
    @Published var password = ""
    @Published var passwordCheck = ""
    @Published var isShowPasswordCheck = false
    @Published var isNavigateSignupInfo = false

    var isEnableNextButton: Bool {
        !password.isEmpty && !passwordCheck.isEmpty
    }

    @MainActor
    func nextButtonDidTap() {
        isShowPasswordCheck = true
    }

    func checkPassword() {
        if password == passwordCheck {
            isNavigateSignupInfo = true
        } else {
            isError = true
            errorMessage = "비밀번호가 일치하지 않습니다."
        }
    }
}
