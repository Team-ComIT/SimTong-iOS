import SwiftUI
import DesignSystem

struct EmailModifyView: View {
    @StateObject var viewModel: EmailModifyViewModel
    @FocusState var focusField: Bool
    @Environment(\.dismiss) var dismiss
    private let emailVerifyComponent: EmailVerifyComponent

    public init(
        viewModel: EmailModifyViewModel,
        emailVerifyComponent: EmailVerifyComponent
    ) {
        _viewModel = StateObject(wrappedValue: viewModel)
        self.emailVerifyComponent = emailVerifyComponent
    }

    var body: some View {
        ZStack {
            VStack {
                STTextField(
                    labelText: "이메일",
                    text: $viewModel.email,
                    style: .clear,
                    errorText: viewModel.errorMessage,
                    isError: viewModel.isError,
                    onCommit: {
                        viewModel.modifyButtonDidTap()
                    }
                )
                .focused($focusField)
                .padding([.top, .horizontal])

                Spacer()

                WideButton(text: "인증번호 받기") {
                    viewModel.modifyButtonDidTap()
                }
                .disabled(viewModel.email.isEmpty)
            }
        }
        .onAppear {
            focusField = true
        }
        .navigationTitle("이메일 수정하기")
        .navigationBarTitleDisplayMode(.inline)
        .navigate(to: emailVerifyComponent.makeView(), when: $viewModel.isSuccessNicknameModify)
        .stBackground()
        .configBackButton(willDismiss: {
            viewModel.isPresentedTerms = true
        }, dismiss: dismiss)
    }
}
