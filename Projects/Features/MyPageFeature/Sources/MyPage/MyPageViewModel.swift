import BaseFeature
import Combine
import DomainModule
import UIKit

public final class MyPageViewModel: BaseViewModel {
    private let fetchMyProfileUseCase: any FetchMyProfileUseCase
    private let logoutUseCase: any LogoutUseCase
    private let uploadSingleFileUseCase: any UploadSingleFileUseCase
    private let changeProfileImageUseCase: any ChangeProfileImageUseCase
    @Published var myProfile: UserInfoEntity = .init(
        name: "김이름",
        email: "test@gmail.com",
        nickname: "멋있는_이름",
        spot: "성심당 은행점 본점",
        profileImagePath: ""
    )
    @Published var selectedImage: UIImage?
    @Published var isSkeleton = false
    @Published var isModify = false
    @Published var isPresentedImagePicker = false
    @Published var isNavigateNickname = false
    @Published var isNavigateEmail = false
    @Published var isNaivgateSpot = false
    @Published var isNavigatePassword = false
    @Published var isLogout = false
    var bag = Set<AnyCancellable>()

    init(
        fetchMyProfileUseCase: any FetchMyProfileUseCase,
        logoutUseCase: any LogoutUseCase,
        uploadSingleFileUseCase: any UploadSingleFileUseCase,
        changeProfileImageUseCase: any ChangeProfileImageUseCase
    ) {
        self.fetchMyProfileUseCase = fetchMyProfileUseCase
        self.logoutUseCase = logoutUseCase
        self.uploadSingleFileUseCase = uploadSingleFileUseCase
        self.changeProfileImageUseCase = changeProfileImageUseCase
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

    func profileButtonDidTap() {
        if isModify {
            isPresentedImagePicker = true
        }
    }

    func changeProfileImage(image: UIImage?) {
        Task {
            await withAsyncTry(with: self) { owner in
                let imageData = image?.pngData() ?? .init()
                let url = try await owner.uploadSingleFileUseCase.execute(imageData)
                try await owner.changeProfileImageUseCase.execute(imageURL: url)
            }
        }
    }

    func nicknameButtonDidTap() {
        if isModify {
            isNavigateNickname = true
        }
    }

    func emailButtonDidTap() {
        if isModify {
            isNavigateEmail = true
        }
    }

    func spotButtonDidTap() {
        if isModify {
            isNaivgateSpot = true
        }
    }

    func logoutButtonDidTap() {
        isLogout = true
    }

    func logoutCheckButtonDidTap() {
        self.logoutUseCase.execute()
    }

    func changePasswordButtonDidTap() {
        if isModify {
            isNavigatePassword = true
        }
    }

    func spotDidSelect(spotName: String) {
        let spot = UserInfoEntity(
            name: myProfile.name,
            email: myProfile.email,
            nickname: myProfile.nickname,
            spot: spotName,
            profileImagePath: myProfile.profileImagePath
        )
        myProfile = spot
    }
}
