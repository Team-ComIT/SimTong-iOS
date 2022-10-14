import BaseFeature
import Combine
import DomainModule

public final class RenewalPasswordViewModel: BaseViewModel {
    private let resetPasswordUseCase: any ResetPasswordUseCase

    public init(
        resetPasswordUseCase: any ResetPasswordUseCase
    ) {
        self.resetPasswordUseCase = resetPasswordUseCase
    }
}
