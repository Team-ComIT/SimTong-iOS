import Combine
import CommonFeature

public final class SignupViewModel: BaseViewModel {
    @Published var nameText: String = ""
    @Published var numberText: String = ""
    @Published var emailText: String = ""
    @Published var isNameText: Bool = false
    @Published var isNumberText: Bool = false
    @Published var isEmailText: Bool = false

    func isShowNumberText() {
        isNameText == true && isNumberText == true
    }
 }
