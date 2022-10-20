import BaseFeature
import Combine
import SwiftUI

final class FindPasswordVerifyViewModel: BaseViewModel {
    @Published var authCode = ""
    @Published var remaingTime = 300
    private let timer = Timer.publish(every: 1, on: .main, in: .common)
    private var timerSubscription: Cancellable?

    deinit {
        timerSubscription?.cancel()
        timerSubscription = nil
    }

    @MainActor
    func completeButtonDidTap() {
    }

    @MainActor
    func resendButtonDidTap() {
    }
}
