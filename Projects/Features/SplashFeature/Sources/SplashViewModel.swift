import BaseFeature
import Combine
import DomainModule

final class SplashViewModel: BaseViewModel {
    @Published var isAutoSignin: Bool?

    private let reissueTokenUseCase: any ReissueTokenUseCase

    init(reissueTokenUseCase: any ReissueTokenUseCase) {
        self.reissueTokenUseCase = reissueTokenUseCase
    }

    @MainActor
    func onAppear() async {
        await withAsyncTry(with: self) { owner in
            try await owner.reissueTokenUseCase.execute()
            owner.isAutoSignin = false
        }
    }
}
