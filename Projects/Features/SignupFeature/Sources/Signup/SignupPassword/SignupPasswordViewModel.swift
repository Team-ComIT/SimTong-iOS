import BaseFeature
import Combine
import Foundation
import Utility

final class SignupPasswordViewModel: BaseViewModel {
    @Published var password = "" {
        didSet { isError = false }
    }
    @Published var passwordCheck = "" {
        didSet { isError = false }
    }
    @Published var isShowPasswordCheck = false
    @Published var isNavigateSignupInfo = false
    let signupPasswordSceneParam: SignupPasswordSceneParam

    init(signupPasswordSceneParam: SignupPasswordSceneParam) {
        self.signupPasswordSceneParam = signupPasswordSceneParam
    }

    var isEnableNextButton: Bool {
        !password.isEmpty && !passwordCheck.isEmpty
    }

    @MainActor
    func nextButtonDidTap() {
        isShowPasswordCheck = true
    }

    func checkPassword() {
        let passwordPattern = "^(?=.*[A-Za-z])(?=.*[0-9])(?=.*[$_+-]).{8,20}"
        guard password ~= passwordPattern else {
            isError = true
            errorMessage = "비밀번호는 8~20자이고 영문, 숫자, 특수기호($+-_)가 모두 포함되어야합니다."
            return
        }

        if password == passwordCheck {
            isNavigateSignupInfo = true
        } else {
            isError = true
            errorMessage = "비밀번호가 일치하지 않습니다."
        }
    }
}
