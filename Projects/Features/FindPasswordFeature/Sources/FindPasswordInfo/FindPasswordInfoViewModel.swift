import BaseFeature
import Combine
import DomainModule
import SwiftUI

final class FindPasswordInfoViewModel: BaseViewModel {
    @Published var name = ""
    @Published var email = ""
    @Published var code = ""
    @Published var remainingTime = 300
    @Published var isNavigateFindPasswordVerify = false
    private let timer = Timer.publish(every: 1, on: .main, in: .common)
    private var bag = Set<AnyCancellable>()

    private let checkExistNameAndEmailUseCase: any CheckExistNameAndEmailUseCase

    init(
        checkExistNameAndEmailUseCase: any CheckExistNameAndEmailUseCase
    ) {
        self.checkExistNameAndEmailUseCase = checkExistNameAndEmailUseCase

        super.init()

        timer.sink { [weak self] _ in
            self?.remainingTime -= 1
        }
        .store(in: &bag)
    }

    @MainActor
    func completeButtonDidTap() {
        Task {
            await withAsyncTry(with: self) { owner in
                owner.isNavigateFindPasswordVerify = true
            }
        }
    }
}
