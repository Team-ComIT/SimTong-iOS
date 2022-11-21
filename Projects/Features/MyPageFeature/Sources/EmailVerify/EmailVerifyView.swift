import SwiftUI
import DesignSystem

struct EmailVerifyView: View {

    @StateObject var viewModel: EmailVerifyViewModel
    @Environment(\.dismiss) var dismiss
    @EnvironmentObject var test: MyPageRouteBuilder
    @FocusState private var focusField: Bool

    public init(
        viewModel: EmailVerifyViewModel
    ) {
        _viewModel = StateObject(wrappedValue: viewModel)
        viewModel.timerStart()
    }

    var body: some View {
        VStack {
            ZStack(alignment: .topTrailing) {
                STTextField(
                    "이메일을 확인해보세요!",
                    labelText: "인증번호",
                    text: $viewModel.authCode,
                    style: .clear,
                    errorText: viewModel.errorMessage,
                    isError: viewModel.isError, onCommit: {
                        viewModel.completeButtonDidTap()
                    }
                )
                .focused($focusField)

                Text("남은시간 \(viewModel.timeText)")
                    .stTypo(.m6, color: .extraError)
            }
            .padding(.top, 24)
            .padding(.horizontal, 16)

            CTAButton(text: "재발송", style: .cancel) {
                viewModel.resendCodeButtonDidTap()
            }
            .padding(.top, 8)
            .padding(.horizontal, 16)

            Spacer()

            WideButton(text: "확인") {
                viewModel.completeButtonDidTap()
            }
            .disabled(viewModel.authCode.isEmpty)
        }
        .onChange(of: viewModel.isVerified) { newValue in
            if newValue {
                test.routeBuilder = false
            }
        }
        .stBackground()
        .configBackButton(dismiss: dismiss)
    }
}
