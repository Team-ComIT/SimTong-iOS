import Combine
import SwiftUI
import BaseFeature

public final class SignupInfoViewModel: BaseViewModel {
    @Published var nickname = ""
    @Published var isShowImage = false
    @Published var image: UIImage?

    var isEnableNextButton: Bool {
        !nickname.isEmpty && image != nil
    }

    var isSkip: Bool {
        nickname.isEmpty && image == nil
    }
}
