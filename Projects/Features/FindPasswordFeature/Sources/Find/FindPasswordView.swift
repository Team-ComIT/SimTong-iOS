import DesignSystem
import SwiftUI

struct FindPasswordView: View {
    private enum FocusField: Hashable {
        case name
        case email
        case code
    }

    @StateObject var viewModel: FindPasswordViewModel
    @FocusState private var focusField: FocusField?

    public init(viewModel: FindPasswordViewModel) {
        _viewModel = StateObject(wrappedValue: viewModel)
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
                style: .button,
                buttonText: "인증",
                errorText: viewModel.errorMessage,
                isError: viewModel.isError,
                buttonAction: {
                    viewModel.verifyButtonDidTap()
                }, onCommit: {
                    viewModel.verifyButtonDidTap()
                }
            )
            .focused($focusField, equals: .email)
            .onChange(of: viewModel.email) { _ in
                viewModel.isError = false
            }

            if viewModel.isTimerStarted {
                STTextField(
                    "인증코드를 입력해주세요",
                    text: $viewModel.code,
                    errorText: viewModel.errorMessage,
                    isError: viewModel.isVerifyAuthCodeError,
                    onCommit: {
                        viewModel.completeButtonDidTap()
                    }
                )
                .keyboardType(.numberPad)
                .onChange(of: viewModel.code) { _ in
                    viewModel.isVerifyAuthCodeError = false
                }
                .overlay(alignment: .topTrailing) {
                    Text("\(viewModel.remainingTime/60):\(viewModel.remainingTime%60)")
                        .stTypo(.m6, color: .extraError)
                        .padding(.top, 16)
                        .padding(.trailing, 16)
                }
            }

            CTAButton(text: "확인") {
                viewModel.completeButtonDidTap()
            }
            .padding(.top, 32)
            .disabled(viewModel.code.isEmpty)
            .transition(.move(edge: .top))

            Spacer()
        }
        .animation(.default, value: viewModel.isTimerStarted)
        .padding(.horizontal, 16)
        .onReceive(viewModel.timer) { _ in
            viewModel.remainingTime -= 1
        }
    }
}
