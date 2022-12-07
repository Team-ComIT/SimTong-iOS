import Combine
import BaseFeature
import DomainModule

final class EmailModifyViewModel: BaseViewModel {
    private let sendAuthCodeUseCase: SendAuthCodeUseCase
    @Published var email = "" {
        didSet { isError = false}
    }
    @Published var isSuccessNicknameModify = false
    @Published var isPresentedTerms = false

    init(sendAuthCodeUseCase: SendAuthCodeUseCase) {
        self.sendAuthCodeUseCase = sendAuthCodeUseCase
    }

    @MainActor
    func modifyButtonDidTap() {
        Task {
            await withAsyncTry(with: self) { owner in
                try await owner.sendAuthCodeUseCase.execute(email: owner.email)
                owner.isSuccessNicknameModify = true
            }
        }
    }
}
