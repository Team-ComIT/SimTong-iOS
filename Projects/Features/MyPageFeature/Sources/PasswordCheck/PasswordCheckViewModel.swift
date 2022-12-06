import Combine
import BaseFeature
import DomainModule

final class PasswordCheckViewModel: BaseViewModel {
    private let comparePasswordUseCase: any ComparePasswordUseCase
    @Published var password = "" {
        didSet { isError = false }
    }
    @Published var isSuccessPasswordCheck = false
    @Published var isNavigateFindPassword = false

    init(
        comparePasswordUseCase: any ComparePasswordUseCase
    ) {
        self.comparePasswordUseCase = comparePasswordUseCase
        super.init()
    }

    @MainActor
    func checkButtonDidTap() {
        Task {
            await withAsyncTry(with: self) { owner in
                try await owner.comparePasswordUseCase.execute(password: owner.password)
            } errorAction: { _, error in
                print(error)
            }
            self.isSuccessPasswordCheck = true
        }
    }
}
