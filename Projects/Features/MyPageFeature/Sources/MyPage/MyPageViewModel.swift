import BaseFeature
import Combine
import DomainModule
import UIKit

public final class MyPageViewModel: BaseViewModel {
    private let fetchMyProfileUseCase: any FetchMyProfileUseCase
    @Published var myProfile: UserInfoEntity = .init(
        name: "김이름",
        email: "test@gmail.com",
        nickname: "멋있는_이름",
        spot: "성심당 은행점 본점",
        profileImagePath: "https://avatars.githubusercontent.com/u/74440939?v=4"
    )
    @Published var selectedImage: UIImage?
    @Published var isSkeleton = false
    @Published var isModify = false
    @Published var isNavigateNickname = false

    init(
        fetchMyProfileUseCase: any FetchMyProfileUseCase
    ) {
        self.fetchMyProfileUseCase = fetchMyProfileUseCase
        super.init()
        self.isSkeleton = true
    }

    @MainActor
    func loadMyInfo() async {
        await withAsyncTry(with: self) { owner in
            let user = try await owner.fetchMyProfileUseCase.execute()
            owner.myProfile = user
            owner.isSkeleton = false
        }
    }

    func modify() {
        isModify.toggle()
    }

    func nicknameButtonDidTap() {
        if isModify {
            isNavigateNickname = true
        }
    }

}
