import BaseFeature
import Combine
import DomainModule
import SwiftUI
import FirebaseMessaging
import Utility

public final class SignupInfoViewModel: BaseViewModel {
    @Published var nickname = "" {
        didSet { isError = false }
    }
    @Published var image: UIImage?
    @Published var isNotSupportImageType = false
    @Published var isSuccessSignup = false
    var isSkip: Bool {
        nickname.isEmpty && image == nil
    }

    let signupInfoSceneParam: SignupInfoSceneParam
    private let checkDuplicateNicknameUseCase: any CheckDuplicateNicknameUseCase
    private let uploadSingleFileUseCase: any UploadSingleFileUseCase
    private let signupUseCase: any SignupUseCase

    init(
        signupInfoSceneParam: SignupInfoSceneParam,
        checkDuplicateNicknameUseCase: any CheckDuplicateNicknameUseCase,
        uploadSingleFileUseCase: any UploadSingleFileUseCase,
        signupUseCase: any SignupUseCase
    ) {
        self.signupInfoSceneParam = signupInfoSceneParam
        self.checkDuplicateNicknameUseCase = checkDuplicateNicknameUseCase
        self.uploadSingleFileUseCase = uploadSingleFileUseCase
        self.signupUseCase = signupUseCase
    }

    @MainActor
    func nextButtonDidTap() {
        checkNickname()
        guard let deviceToken = Messaging.messaging().fcmToken else { return }

        Task {
            await withAsyncTry(with: self) { owner in
                try await owner.checkDuplicateNicknameUseCase.execute(nickname: owner.nickname)
                var url: String?
                if let image = owner.image {
                    let imageData = image.pngData() ?? .init()
                    url = try await owner.uploadSingleFileUseCase.execute(imageData)
                }
                try await owner.signupUseCase.execute(
                    req: .init(
                        name: owner.signupInfoSceneParam.name,
                        employeeNumber: Int(owner.signupInfoSceneParam.employeeID) ?? 0,
                        email: owner.signupInfoSceneParam.email,
                        password: owner.signupInfoSceneParam.password,
                        nickname: owner.nickname.isEmpty ? nil : owner.nickname,
                        profileImagePath: url,
                        deviceToken: deviceToken
                    )
                )
                owner.isSuccessSignup = true
            }
        }
    }

    func checkNickname() {
        let nicknamePattern = "(?=^\\S)(?=^[\\w\\s가-힣.]{1,20}$).*(?=\\S$)."
        guard nickname ~= nicknamePattern else {
            isError = true
            errorMessage = "닉네임 (.마침표)(_언더라인)외의 특수문자는 사용할 수 없습니다."
            return
        }
    }
}
