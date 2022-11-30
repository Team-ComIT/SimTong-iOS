import BaseFeature
import DomainModule
import Foundation
import Combine

public final class SignupVerifyViewModel: BaseViewModel {
    @Published var authCode = "" {
        didSet { isError = false }
    }
    @Published var timeText = ""
    @Published var timeRemaining = 300
    @Published var isVerified = false
    @Published var isToastShow = false
    let signupVerifySceneParam: SignupVerifySceneParam
    private let timer = Timer.publish(every: 1, on: .main, in: .common).autoconnect()
    private var bag = Set<AnyCancellable>()

    private let sendAuthCodeUseCase: any SendAuthCodeUseCase
    private let verifyAuthCodeUseCase: any VerifyAuthCodeUseCase

    init(
        sendAuthCodeUseCase: any SendAuthCodeUseCase,
        verifyAuthCodeUseCase: any VerifyAuthCodeUseCase,
        signupVerifySceneParam: SignupVerifySceneParam
    ) {
        self.sendAuthCodeUseCase = sendAuthCodeUseCase
        self.verifyAuthCodeUseCase = verifyAuthCodeUseCase
        self.signupVerifySceneParam = signupVerifySceneParam
    }

    deinit {
        bag.removeAll()
    }

    @MainActor
    func timerStart() {
        Task {
            await withAsyncTry(with: self) { owner in
                try await owner.sendAuthCodeUseCase.execute(email: owner.signupVerifySceneParam.email)
                owner.isToastShow = true
            }

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
    }

    @MainActor
    func completeButtonDidTap() {
        Task {
            await withAsyncTry(with: self, action: { owner in
                try await owner.verifyAuthCodeUseCase.execute(
                    email: owner.signupVerifySceneParam.email,
                    code: owner.authCode
                )
            })
        }
        self.isVerified = true
    }

    func resendCodeButtonDidTap() {
        Task {
            await withAsyncTry(with: self, action: { owner in
                try await owner.sendAuthCodeUseCase.execute(email: owner.signupVerifySceneParam.email)
                owner.timeRemaining = 300
                owner.isToastShow = true
            })
        }
    }
}
