import BaseFeature
import Combine

final class FindPasswordVerifyViewModel: BaseViewModel {
    @Published var authCode = ""

    @MainActor
    func completeButtonDidTap() {
    }

    @MainActor
    func resendButtonDidTap() {
    }
}
