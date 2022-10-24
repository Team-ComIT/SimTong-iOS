import Combine
import DomainModule
import BaseFeature

final class SigninViewModel: BaseViewModel {
    @Published var authCode = "" {
        didSet { isError = false }
    }
    @Published var employeeID = ""
    @Published var password = ""
    @Published var isSignin = false
    private let signinUseCase: any SigninUseCase

    init(
        signinUseCase: any SigninUseCase
    ) {
        self.signinUseCase = signinUseCase
    }

    var isCheckSignin: Bool {
        employeeID.isEmpty || password.isEmpty
    }

    @MainActor
    func signin() {
        Task {
            await withAsyncTry(with: self) { owner in
                try await
                owner.signinUseCase.execute(
                    req: .init(
                        employeeID: self.employeeID.hashValue,
                        password: self.password
                    )
                )
                owner.isSignin = true
            }
        }
    }
}
