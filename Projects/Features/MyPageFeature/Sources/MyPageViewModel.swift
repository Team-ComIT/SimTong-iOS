import BaseFeature
import Combine
import DomainModule
import UIKit

public final class MyPageViewModel: BaseViewModel {
    private let fetchMyProfileUseCase: any FetchMyProfileUseCase
    @Published var myProfile: UserInfo = .init(
        name: "김이름",
        email: "test@gmail.com",
        nickname: "멋있는_이름",
        spot: "성심당 은행점 본점",
        profileImagePath: "https://avatars.githubusercontent.com/u/74440939?v=4"
    )
    @Published var selectedImage: UIImage?
    @Published var isSkeleton = false

    init(
        fetchMyProfileUseCase: any FetchMyProfileUseCase
    ) {
        self.fetchMyProfileUseCase = fetchMyProfileUseCase
        super.init()
        self.isSkeleton = true

        Task {
            await withAsyncTry(with: self) { owner in
                let user = try await owner.fetchMyProfileUseCase.execute()
                owner.myProfile = user
                owner.isSkeleton = false
            } errorAction: { [weak self] error in
                self?.isError = true
                self?.errorMessage = error.localizedDescription
                self?.isSkeleton = false
            }
        }
    }
}
