import DesignSystem
import SwiftUI

struct FindPasswordInfoView: View {
    private enum FocusField: Hashable {
        case name
        case email
        case code
    }

    @StateObject private var viewModel: FindPasswordInfoViewModel
    @FocusState private var focusField: FocusField?
    private let renewalPasswordComponent: RenewalPasswordComponent

    public init(
        viewModel: FindPasswordInfoViewModel,
        renewalPasswordComponent: RenewalPasswordComponent
    ) {
        _viewModel = StateObject(wrappedValue: viewModel)
        self.renewalPasswordComponent = renewalPasswordComponent
    }

    var body: some View {
        VStack(spacing: 8) {
            STTextField("이름을 입력해주세요", text: $viewModel.name, style: .clear, onCommit: {
                focusField = .email
            })
            .focused($focusField, equals: .name)
            .padding(.top, 64)

            STTextField(
                "이메일을 입력해주세요",
                text: $viewModel.email,
                buttonText: "인증",
                errorText: viewModel.errorMessage,
                isError: viewModel.isError
            )
            .focused($focusField, equals: .email)

            CTAButton(text: "확인") {
                viewModel.completeButtonDidTap()
            }
            .padding(.top, 16)
            .disabled(viewModel.code.isEmpty)

            Spacer()
        }
        .padding(.horizontal, 16)
        .stLoading(isLoading: $viewModel.isLoading)
    }
}
