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
    @Published var isSuccessSignin = false
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
        guard !isDisabledSignin else { return }

        Task {
            await withAsyncTry(with: self) { owner in
                guard let id = Int(owner.employeeID) else { return }
                try await owner.signinUseCase.execute(
                    req: .init(
                        employeeID: id,
                        password: owner.password
                    )
                )
                owner.isSuccessSignin = true
            }
        }
    }
}
