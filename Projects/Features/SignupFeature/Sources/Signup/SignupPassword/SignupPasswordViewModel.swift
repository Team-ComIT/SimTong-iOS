import Combine
import BaseFeature

final class SignupPasswordViewModel: BaseViewModel {
    @Published var password = ""
    @Published var passwordCheck = ""
    @Published var isShowPasswordCheck = false
    @Published var isPasswordCheck = false

    var isEnableNextButton: Bool {
        !password.isEmpty && !passwordCheck.isEmpty
    }

    @MainActor
    func nextButtonDidTap() {
        isShowPasswordCheck = true
    }

    func checkPassword() {
        isPasswordCheck = password == passwordCheck
    }
}
