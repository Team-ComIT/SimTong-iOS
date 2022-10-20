import BaseFeature
import Combine
import DomainModule

public final class MyPageViewModel: BaseViewModel {
    private let fetchMyProfileUseCase: any FetchMyProfileUseCase

    init(
        fetchMyProfileUseCase: any FetchMyProfileUseCase
    ) {
        self.fetchMyProfileUseCase = fetchMyProfileUseCase
        super.init()
    }
}
