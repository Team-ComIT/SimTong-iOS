import Combine
import BaseFeature
import DomainModule

final class PasswordChangeViewModel: BaseViewModel {
    @Published var password = "" {
        didSet { isError = false }
    }
    @Published var isSuccessPasswordChange = false
//    private let 

    @MainActor
    func changeButtonDidTap() {
        isSuccessPasswordChange = true
    }
}
