import Combine
import BaseFeature

public final class SignupViewModel: BaseViewModel {
    @Published var name: String = ""
    @Published var number: String = ""
    @Published var email: String = ""
    @Published var nextButtonTitle = "다음"
    @Published var isNumberStep = false
    @Published var isEmailStep = false

    var isEnableNextButton: Bool {
        !name.isEmpty && (!number.isEmpty || !isNumberStep) && (!email.isEmpty || !isEmailStep)
    }

    @MainActor
    func nextButtonDidTap() {
        if isEmailStep {
        } else if isNumberStep {
            isEmailStep = true
            nextButtonTitle = "인증"
        } else {
            isNumberStep = true
            nextButtonTitle = "확인"
        }
    }
 }
