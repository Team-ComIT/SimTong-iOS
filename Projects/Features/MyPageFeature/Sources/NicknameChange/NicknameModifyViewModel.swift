import Combine
import BaseFeature
import DomainModule

final class NicknameChangeViewModel: BaseViewModel {
    @Published var nickname = "" {
        didSet { isError = false }
    }
    @Published var isSuccessNicknameChange = false

    @MainActor
    func changeButtonDidTap() {
        isSuccessNicknameChange = true
    }
}
