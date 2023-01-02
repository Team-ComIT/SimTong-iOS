import Combine
import DomainModule
import BaseFeature
import FirebaseMessaging

final class SigninViewModel: BaseViewModel {
    @Published var employeeID = "" {
        didSet { isError = false }
    }
    @Published var password = "" {
        didSet { isError = false }
    }
    @Published var isSuccessSignin = false
    @Published var isNavigateFindAuthInfo = false
    private let signinUseCase: any SigninUseCase

    init(
        signinUseCase: any SigninUseCase
    ) {
        self.signinUseCase = signinUseCase
    }

    var isDisabledSignin: Bool {
        employeeID.isEmpty || password.isEmpty
    }

    @MainActor
    func signin() {
        guard !isDisabledSignin, let deviceToken = Messaging.messaging().fcmToken else { return }

        Task {
            await withAsyncTry(with: self) { owner in
                guard let id = Int(owner.employeeID) else { return }
                try await owner.signinUseCase.execute(
                    req: .init(
                        employeeID: id,
                        password: owner.password,
                        deviceToken: deviceToken
                    )
                )
                owner.isSuccessSignin = true
            }
        }
    }
}
