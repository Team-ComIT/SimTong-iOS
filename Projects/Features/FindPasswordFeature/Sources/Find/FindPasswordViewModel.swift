import BaseFeature
import Combine
import DomainModule
import SwiftUI

final class FindPasswordViewModel: BaseViewModel {
    @Published var name = ""
    @Published var email = ""
    @Published var code = ""
    @Published var remainingTime = 300
    @Published var isVerifyAuthCodeError = false
    @Published var isSuccessEmailVerify = false
    let timer = Timer.publish(every: 1, on: .main, in: .common)
    private var timerSubscription: Cancellable?
    var isTimerStarted: Bool = false

    private let sendAuthCodeUseCase: any SendAuthCodeUseCase
    private let verifyAuthCodeUseCase: any VerifyAuthCodeUseCase

    init(
        sendAuthCodeUseCase: any SendAuthCodeUseCase,
        verifyAuthCodeUseCase: any VerifyAuthCodeUseCase
    ) {
        self.sendAuthCodeUseCase = sendAuthCodeUseCase
        self.verifyAuthCodeUseCase = verifyAuthCodeUseCase
    }

    deinit {
        timerSubscription?.cancel()
        timerSubscription = nil
    }

    @MainActor
    func verifyButtonDidTap() {
        if !isTimerStarted {
            isTimerStarted = true
            timerSubscription = timer.connect()
        }
        remainingTime = 300
        guard !email.isEmpty else { return }
        Task {
            await withAsyncTry(with: self) { owner in
                try await owner.sendAuthCodeUseCase.execute(email: owner.email)
            }
        }
    }

    @MainActor
    func completeButtonDidTap() {
        Task {
            await withAsyncTry(with: self, action: { owner in
                try await owner.verifyAuthCodeUseCase.execute(email: owner.email, code: owner.code)
                owner.isSuccessEmailVerify = true
            }, errorAction: { owner, error in
                owner.isVerifyAuthCodeError = true
                owner.errorMessage = error.localizedDescription
            })
        }
    }
}
