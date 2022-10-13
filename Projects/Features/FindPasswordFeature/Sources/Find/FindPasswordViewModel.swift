import BaseFeature
import Combine
import SwiftUI

final class FindPasswordViewModel: BaseViewModel {
    @Published var name = ""
    @Published var email = ""
    @Published var code = ""
    @Published var remainingTime = 300
    @Published var isVerifyAuthCodeError = false
    let timer = Timer.publish(every: 1, on: .main, in: .common)
    private var timerSubscription: Cancellable?
    var isTimerStarted: Bool = false

    deinit {
        timerSubscription?.cancel()
        timerSubscription = nil
    }

    @MainActor
    func verifyButtonDidTap() {
        if !isTimerStarted {
            timerSubscription = timer.connect()
        }
        isTimerStarted = true
        remainingTime = 300
    }

    @MainActor
    func completeButtonDidTap() {

    }
}
