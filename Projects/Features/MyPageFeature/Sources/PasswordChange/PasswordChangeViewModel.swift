import Combine
import BaseFeature
import DomainModule

final class PasswordChangeViewModel: BaseViewModel {
    @Published var password = "" {
        didSet { isError = false }
    }
    @Published var checkPassword = "" {
        didSet { isError = false }
    }
    @Published var isSuccessPasswordChange = false
    @Published var isNavigateFindPassword = false
//    @Published var
//    private let

    @MainActor
    func changeButtonDidTap() {
        isSuccessPasswordChange = true
    }
}
