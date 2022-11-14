import Combine
import BaseFeature
import DomainModule

final class NicknameModifyViewModel: BaseViewModel {
    @Published var nickname = "" {
        didSet { isError = false }
    }
    @Published var isSuccessNicknameModify = false

    @MainActor
    func modifyButtonDidTap() {
        isSuccessNicknameModify = true
    }
}
