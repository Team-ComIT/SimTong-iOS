import BaseFeature
import Foundation
import Combine

public final class SignupVerifyViewModel: BaseViewModel {
    @Published var certificationNumber = ""
    @Published var timeText = ""
    @Published var timeRemaining = 300
    @Published var count: Int = 1
    @Published var isVerified = false
    @Published var isToastShow = false
    let timer = Timer.publish(every: 1, on: .main, in: .common)
    private var timerSubscription: Cancellable?

    func updateTimeRemaining() {
        timerSubscription = timer.connect()
        timeText = timeRemaining % 60 < 10 ?
        "\(timeRemaining/60):0\(timeRemaining%60)" :
        "\(timeRemaining/60):\(timeRemaining%60)"
    }

    func authCode() {
        isVerified = true
    }
}
