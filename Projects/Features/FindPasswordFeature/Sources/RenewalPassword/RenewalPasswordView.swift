import DesignSystem
import SwiftUI
import Utility

struct RenewalPasswordView: View {
    private enum FocusField: Hashable {
        case password
        case passwordCheck
    }

    @StateObject private var viewModel: RenewalPasswordViewModel
    @FocusState private var focusField: FocusField?
    @Environment(\.dismiss) var dismiss

    public init(
        viewModel: RenewalPasswordViewModel
    ) {
        _viewModel = StateObject(wrappedValue: viewModel)
    }

    var body: some View {
        VStack(spacing: 8) {
            STSecureTextField("새 비밀번호를 입력해주세요", text: $viewModel.password, isError: viewModel.isError, onCommit: {
                focusField = .passwordCheck
            })
            .focused($focusField, equals: .password)
            .padding(.top, 64)

            STSecureTextField(
                "비밀번호를 다시 확인해주세요",
                text: $viewModel.passwordCheck,
                errorText: viewModel.errorMessage,
                isError: viewModel.isError,
                onCommit: {
                    viewModel.completeButtonDidTap()
                }
            )
            .focused($focusField, equals: .passwordCheck)

            CTAButton(text: "확인") {
                viewModel.completeButtonDidTap()
            }
            .padding(.top, 32)
            .disabled(viewModel.password.isEmpty || viewModel.passwordCheck.isEmpty)

            Spacer()
        }
        .onAppear {
            focusField = .password
        }
        .stBackground()
        .padding(.horizontal, 16)
        .configBackButton(dismiss: dismiss)
        .onChange(of: viewModel.isSuccessRenewal) { newValue in
            if newValue {
                NavigationUtil.popToRootView()
            }
        }
        .stSnackbar(isShowing: $viewModel.isSuccessRenewal, text: "비밀번호 변경이 완료되었습니다.")
    }
}
