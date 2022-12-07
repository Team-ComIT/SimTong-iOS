import Combine
import Foundation
import BaseFeature
import DomainModule

final class EmailVerifyViewModel: BaseViewModel {
    @Published var authCode = "" {
        didSet { isError = false }
    }
    @Published var timeText = ""
    @Published var timeRemaining = 300
    @Published var isVerified = false
    @Published var isToastShow = false
    private let email: String
    private let verifyAuthCodeUseCase: VerifyAuthCodeUseCase
    private let timer = Timer.publish(every: 1, on: .main, in: .common).autoconnect()
    private var bag = Set<AnyCancellable>()

    init(
        email: String,
        verifyAuthCodeUseCase: VerifyAuthCodeUseCase
    ) {
        self.email = email
        self.verifyAuthCodeUseCase = verifyAuthCodeUseCase
    }

    deinit {
        bag.removeAll()
    }

    @MainActor
    func timerStart() {
        self.timeText = self.timeRemaining % 60 < 10 ?
        "\(self.timeRemaining/60):0\(self.timeRemaining%60)" :
        "\(self.timeRemaining/60):\(self.timeRemaining%60)"

        timer.sink { [weak self] _ in
            guard let self, self.timeRemaining > 0 else { return }
            self.timeRemaining -= 1
            self.timeText = self.timeRemaining % 60 < 10 ?
            "\(self.timeRemaining/60):0\(self.timeRemaining%60)" :
            "\(self.timeRemaining/60):\(self.timeRemaining%60)"
        }
        .store(in: &bag)
    }

    @MainActor
    func completeButtonDidTap() {
        Task {
            await withAsyncTry(with: self) { owner in
                try await owner.verifyAuthCodeUseCase.execute(email: owner.email, code: owner.authCode)
                owner.isVerified = true
            }
        }
    }

    @MainActor
    func resendCodeButtonDidTap() {
        Task {
            await withAsyncTry(with: self, action: { owner in
                try await owner.verifyAuthCodeUseCase.execute(email: owner.email, code: owner.authCode)
                owner.isToastShow = true
                owner.timeRemaining = 300
            })
        }
    }
}
