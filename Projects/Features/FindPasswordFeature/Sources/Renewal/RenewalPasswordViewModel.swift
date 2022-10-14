import BaseFeature
import Combine
import DomainModule

public final class RenewalPasswordViewModel: BaseViewModel {
    @Published var password = ""
    @Published var passwordCheck = ""

    private let resetPasswordUseCase: any ResetPasswordUseCase

    public init(
        resetPasswordUseCase: any ResetPasswordUseCase
    ) {
        self.resetPasswordUseCase = resetPasswordUseCase
    }

    @MainActor
    func completeButtonDidTap() {}
}
