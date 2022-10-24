import Combine
import DomainModule
import BaseFeature

final class SigninViewModel: BaseViewModel {
    @Published var employeeID = "" {
        didSet { isError = false }
    }
    @Published var password = "" {
        didSet { isError = false }
    }
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
                print(self.employeeID.hashValue)
                try await
                owner.signinUseCase.execute(
                    req: .init(
                        employeeID: Int(self.employeeID) ?? 0,
                        password: self.password
                    )
                )
                owner.isSignin = true
            }
        }
    }
}
