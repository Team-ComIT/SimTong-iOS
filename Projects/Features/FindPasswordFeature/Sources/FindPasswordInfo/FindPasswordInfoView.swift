import DesignSystem
import SwiftUI

struct FindPasswordInfoView: View {
    private enum FocusField: Hashable {
        case id
        case email
    }

    @StateObject private var viewModel: FindPasswordInfoViewModel
    @FocusState private var focusField: FocusField?
    private let findPasswordVerifyComponent: FindPasswordVerifyComponent

    public init(
        viewModel: FindPasswordInfoViewModel,
        findPasswordVerifyComponent: FindPasswordVerifyComponent
    ) {
        _viewModel = StateObject(wrappedValue: viewModel)
        self.findPasswordVerifyComponent = findPasswordVerifyComponent
    }

    var body: some View {
        VStack(spacing: 8) {
            STTextField("사원번호을 입력해주세요", text: $viewModel.employeeID, style: .clear, onCommit: {
                focusField = .email
            })
            .keyboardType(.numberPad)
            .focused($focusField, equals: .id)
            .padding(.top, 64)
            .onChange(of: viewModel.employeeID) { newValue in
                if newValue.count >= 10 {
                    withAnimation {
                        viewModel.employeeID = String(newValue.prefix(10))
                        focusField = .email
                    }
                }
            }

            STTextField(
                "이메일을 입력해주세요",
                text: $viewModel.email,
                buttonText: "인증",
                errorText: viewModel.errorMessage,
                isError: viewModel.isError,
                onCommit: {
                    viewModel.completeButtonDidTap()
                }
            )
            .focused($focusField, equals: .email)

            CTAButton(text: "확인") {
                viewModel.completeButtonDidTap()
            }
            .padding(.top, 32)
            .disabled(viewModel.employeeID.isEmpty || viewModel.email.isEmpty)

            Spacer()
        }
        .padding(.horizontal, 16)
        .stBackground()
        .stLoading(isLoading: $viewModel.isLoading)
        .navigate(
            to: findPasswordVerifyComponent.makeView(
                findPasswordVerifySceneParam: .init(
                    employeeID: viewModel.employeeID,
                    email: viewModel.email
                )
            ),
            when: $viewModel.isNavigateFindPasswordVerify
        )
    }
}
