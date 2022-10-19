import Combine
import SwiftUI
import BaseFeature

public final class SignupInfoViewModel: BaseViewModel {
    @Published var nickname = ""
    @Published var isShowImage = false
    @Published var image: UIImage?
    @Published var isNotSupportImageType = false

    var isSkip: Bool {
        nickname.isEmpty && image == nil
    }
}
