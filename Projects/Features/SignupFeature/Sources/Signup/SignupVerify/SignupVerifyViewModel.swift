import BaseFeature
import DomainModule
import Foundation
import Combine

public final class SignupVerifyViewModel: BaseViewModel {
    @Published var certificationNumber = ""
    @Published var timeText = ""
    @Published var timeRemaining = 300
    @Published var isVerified = false
    @Published var isToastShow = false
    private let timer = Timer.publish(every: 1, on: .main, in: .common).autoconnect()
    private var bag = Set<AnyCancellable>()

    private let sendAuthCodeUseCase: any SendAuthCodeUseCase
    private let verifyAuthCodeUseCase: any VerifyAuthCodeUseCase
    private let signupVerifySceneParam: SignupVerifySceneParam

    init(
        sendAuthCodeUseCase: any SendAuthCodeUseCase,
        verifyAuthCodeUseCase: any VerifyAuthCodeUseCase,
        signupVerifySceneParam: SignupVerifySceneParam
    ) {
        self.sendAuthCodeUseCase = sendAuthCodeUseCase
        self.verifyAuthCodeUseCase = verifyAuthCodeUseCase
        self.signupVerifySceneParam = signupVerifySceneParam
        super.init()
    }

    deinit {
        bag.removeAll()
    }

    @MainActor
    func timerStart() {
        Task {
            await withAsyncTry(with: self) { owner in
                try await owner.sendAuthCodeUseCase.execute(email: owner.signupVerifySceneParam.email)
            }

            self.timeText = self.timeRemaining % 60 < 10 ?
            "\(self.timeRemaining/60):0\(self.timeRemaining%60)" :
            "\(self.timeRemaining/60):\(self.timeRemaining%60)"

            timer.sink { [weak self] _ in
                guard let self else { return }
                self.timeRemaining -= 1
                self.timeText = self.timeRemaining % 60 < 10 ?
                "\(self.timeRemaining/60):0\(self.timeRemaining%60)" :
                "\(self.timeRemaining/60):\(self.timeRemaining%60)"
            }
            .store(in: &bag)
        }
    }

    func completeButtonDidTap() {
        isVerified = true
    }

    func resendCodeButtonDidTap() {
        isToastShow = true
    }
}
