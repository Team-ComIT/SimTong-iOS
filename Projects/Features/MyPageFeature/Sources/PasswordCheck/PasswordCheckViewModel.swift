import Combine
import BaseFeature
import DomainModule

final class PasswordCheckViewModel: BaseViewModel {
    @Published var password = "" {
        didSet { isError = false }
    }
    @Published var isSuccessPasswordCheck = false
    @Published var isNavigateFindPassword = false
    private let passwordCheckUseCase = any passwordusecase

    @MainActor
    func checkButtonDidTap() {
        isSuccessPasswordCheck = true
    }
}
