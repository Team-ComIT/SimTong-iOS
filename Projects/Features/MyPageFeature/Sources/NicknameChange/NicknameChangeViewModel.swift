import Combine
import BaseFeature
import DomainModule

final class NicknameChangeViewModel: BaseViewModel {
    private let changeNicknameUseCase: any ChangeNicknameUseCase
    @Published var nickname = "" {
        didSet { isError = false }
    }
    @Published var isSuccessNicknameChange = false

    init(
        changeNicknameUseCase: any ChangeNicknameUseCase
    ) {
        self.changeNicknameUseCase = changeNicknameUseCase
    }

    @MainActor
    func changeButtonDidTap() {
        Task {
            await withAsyncTry(with: self) { owner in
                try await owner.changeNicknameUseCase.execute(nickname: owner.nickname)
                owner.isSuccessNicknameChange = true
            }
        }
    }
}
