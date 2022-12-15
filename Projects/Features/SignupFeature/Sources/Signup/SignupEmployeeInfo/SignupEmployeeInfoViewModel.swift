import BaseFeature
import Combine
import DomainModule
import SwiftUI

public final class SignupEmployeeInfoViewModel: BaseViewModel {
    @Published var name: String = "" {
        didSet { isError = false }
    }
    @Published var number: String = "" {
        didSet { isError = false }
    }
    @Published var email: String = "" {
        didSet { isError = false }
    }
    @Published var nextButtonTitle = "다음"
    @Published var isNumberStep = false
    @Published var isEmailStep = false
    @Published var isPresentedTerms = false
    @Published var isNavigateToVerify = false

    var isEnableNextButton: Bool {
        !name.isEmpty && (!number.isEmpty || !isNumberStep) && (!email.isEmpty || !isEmailStep)
    }
    private let checkExistNameAndEmployeeIDUseCase: any CheckExistNameAndEmployeeIDUseCase

    public init(
        checkExistNameAndEmployeeIDUseCase: any CheckExistNameAndEmployeeIDUseCase
    ) {
        self.checkExistNameAndEmployeeIDUseCase = checkExistNameAndEmployeeIDUseCase
    }

    @MainActor
    func nextButtonDidTap() {
        if isEmailStep {
        } else if isNumberStep {
            guard !name.isEmpty else { return }
            Task {
                await withAsyncTry(with: self) { owner in
                    try await owner.checkExistNameAndEmployeeIDUseCase.execute(
                        name: owner.name,
                        employeeNumber: owner.number
                    )
                    withAnimation {
                        owner.isEmailStep = true
                        owner.nextButtonTitle = "인증"
                    }
                }
            }
        } else {
            isNumberStep = true
            nextButtonTitle = "확인"
        }
    }

    @MainActor
    func signup() {
        if !email.isEmpty && isEmailStep && Int(number) != nil {
            Task {
                await withAsyncTry(with: self) { owner in
                    try await owner.checkExistNameAndEmployeeIDUseCase.execute(
                        name: owner.name,
                        employeeNumber: owner.number
                    )
                    owner.isPresentedTerms = true
                }
            }
        }
    }
 }
