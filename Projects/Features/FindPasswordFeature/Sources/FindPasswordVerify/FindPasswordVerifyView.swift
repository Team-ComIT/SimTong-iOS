import SwiftUI
import DesignSystem

struct FindPasswordVerifyVIew: View {
    @StateObject var viewModel: FindPasswordVerifyViewModel

    public init(
        viewModel: FindPasswordVerifyViewModel
    ) {
        _viewModel = StateObject(wrappedValue: viewModel)
    }

    var body: some View {
        VStack(spacing: 8) {
            ZStack(alignment: .topTrailing) {
                STTextField(
                    "인증번호를 입력해주세요",
                    labelText: "인증번호",
                    text: $viewModel.authCode,
                    style: .clear,
                    errorText: viewModel.errorMessage,
                    isError: viewModel.isError,
                    onCommit: {
                        viewModel.completeButtonDidTap()
                    }
                )

                Text("남은 시간 4:50")
                    .stTypo(.m6, color: .extraError)
            }
            .padding(.top, 60)

            CTAButton(text: "재발송", style: .cancel) {
                viewModel.resendButtonDidTap()
            }

            CTAButton(text: "확인") {
                viewModel.completeButtonDidTap()
            }
            .padding(.top, 32)
            .disabled(!viewModel.authCode.isEmpty)

            Spacer()
        }
        .padding(.horizontal, 16)
        .stBackground()
    }
}
