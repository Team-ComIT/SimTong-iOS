import Combine
import SwiftUI
import BaseFeature

public final class SignupInfoViewModel: BaseViewModel {
    @Published var nickname = "" {
        didSet { isError = false }
    }
    @Published var image: UIImage?
    @Published var isNotSupportImageType = false
    let signupInfoSceneParam: SignupInfoSceneParam

    init(signupInfoSceneParam: SignupInfoSceneParam) {
        self.signupInfoSceneParam = signupInfoSceneParam
    }

    var isSkip: Bool {
        nickname.isEmpty && image == nil
    }
}
