import BaseFeature
import Foundation
import Combine

public final class SignupVerifyViewModel: BaseViewModel {
    let timer = Timer.publish(every: 1, on: .main, in: .common).autoconnect()
    @Published var certificationNumber = ""
    @Published var timeRemaining = ""
    @Published var count: Int = 1
    @Published var futureData: Date = Calendar.current.date(byAdding: .minute, value: 5, to: Date()) ?? Date()
    @Published var verify = false
    @Published var isToastShow = false

    func updateTimeRemaining() {
            let remaining = Calendar.current.dateComponents([.minute, .second], from: Date(), to: futureData)
            let minute = remaining.minute ?? 0
            let second = remaining.second ?? 0
        timeRemaining = second < 10 ? "남은시간: \(minute):0\(second)" : "남은시간: \(minute):\(second)"
    }

    func certificationNumberVerify() {
        verify = true
    }
}
