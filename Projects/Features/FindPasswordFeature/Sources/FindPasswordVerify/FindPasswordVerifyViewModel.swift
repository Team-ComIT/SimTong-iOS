import BaseFeature
import Combine
import DomainModule
import SwiftUI

final class FindPasswordVerifyViewModel: BaseViewModel {
    @Published var authCode = "" {
        didSet { isError = false }
    }
    @Published var remaingTime = 300
    @Published var isNavigateRenewalPassword = false
    @Published var timeText = ""
    @Published var isToastShow = false
    private let timer = Timer.publish(every: 1, on: .main, in: .common).autoconnect()
    private var bag = Set<AnyCancellable>()
    private let sendAuthCodeUseCase: any SendAuthCodeUseCase
    private let verifyAuthCodeUseCase: any VerifyAuthCodeUseCase
    let findPasswordVerifySceneParam: FindPasswordVerifySceneParam

    public init(
        sendAuthCodeUseCase: any SendAuthCodeUseCase,
        verifyAuthCodeUseCase: any VerifyAuthCodeUseCase,
        findPasswordVerifySceneParam: FindPasswordVerifySceneParam
    ) {
        self.sendAuthCodeUseCase = sendAuthCodeUseCase
        self.verifyAuthCodeUseCase = verifyAuthCodeUseCase
        self.findPasswordVerifySceneParam = findPasswordVerifySceneParam
    }

    deinit {
        bag.removeAll()
    }

    @MainActor
    func timerStart() {
        Task {
//            await withAsyncTry(with: self) { owner in
//                try await owner.sendAuthCodeUseCase.execute(email: owner.findPasswordVerifySceneParam.email)
//                owner.isToastShow = true
//            }

            self.timeText = self.remaingTime % 60 < 10 ?
            "\(self.remaingTime/60):0\(self.remaingTime%60)" :
            "\(self.remaingTime/60):\(self.remaingTime%60)"

            timer.sink { [weak self] _ in
                guard let self, self.remaingTime > 0 else { return }
                self.remaingTime -= 1
                self.timeText = self.remaingTime % 60 < 10 ?
                "\(self.remaingTime/60):0\(self.remaingTime%60)" :
                "\(self.remaingTime/60):\(self.remaingTime%60)"
            }
            .store(in: &bag)
        }
    }

    @MainActor
    func completeButtonDidTap() {
        Task {
            await withAsyncTry(with: self, action: { owner in
                try await owner.verifyAuthCodeUseCase.execute(
                    email: owner.findPasswordVerifySceneParam.email,
                    code: owner.authCode
                )
                owner.isNavigateRenewalPassword = true
            })
        }
    }

    @MainActor
    func resendButtonDidTap() {
        Task {
            await withAsyncTry(with: self, action: { owner in
                try await owner.sendAuthCodeUseCase.execute(email: owner.findPasswordVerifySceneParam.email)
                owner.remaingTime = 300
                owner.isToastShow = true
            })
        }
    }
}
