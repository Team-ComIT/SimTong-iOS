import BaseFeature
import Combine
import DomainModule
import SwiftUI

final class FindPasswordInfoViewModel: BaseViewModel {
    @Published var employeeID = "" {
        didSet { isError = false }
    }
    @Published var email = "" {
        didSet { isError = false }
    }
    @Published var isNavigateFindPasswordVerify = false
    private let timer = Timer.publish(every: 1, on: .main, in: .common)

    private let checkExistEmployeeIDAndEmailUseCase: any CheckExistEmployeeIDAndEmailUseCase

    init(
        checkExistEmployeeIDAndEmailUseCase: any CheckExistEmployeeIDAndEmailUseCase
    ) {
        self.checkExistEmployeeIDAndEmailUseCase = checkExistEmployeeIDAndEmailUseCase
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
