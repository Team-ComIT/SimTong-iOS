import Combine
import BaseFeature
import DomainModule

final class EmailModifyViewModel: BaseViewModel {
    @Published var email = "" {
        didSet { isError = false}
    }
    @Published var isSuccessNicknameModify = false
    @Published var isPresentedTerms = false

    @MainActor
    func modifyButtonDidTap() {
        isSuccessNicknameModify = true
    }
}
