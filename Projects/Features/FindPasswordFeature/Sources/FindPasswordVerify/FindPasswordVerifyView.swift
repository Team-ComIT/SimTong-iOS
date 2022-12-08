import SwiftUI
import DesignSystem

struct FindPasswordVerifyVIew: View {
    private enum FocusField {
        case code
    }
    @StateObject var viewModel: FindPasswordVerifyViewModel
    @Environment(\.dismiss) var dismiss
    @FocusState private var focusField: FocusField?
    private let renewalPasswordComponent: RenewalPasswordComponent

    public init(
        viewModel: FindPasswordVerifyViewModel,
        renewalPasswordComponent: RenewalPasswordComponent
    ) {
        _viewModel = StateObject(wrappedValue: viewModel)
        self.renewalPasswordComponent = renewalPasswordComponent
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
                .focused($focusField, equals: .code)

                Text("남은 시간 \(viewModel.timeText)")
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
            .disabled(viewModel.authCode.isEmpty)

            Spacer()
        }
        .onAppear {
            focusField = .code
            viewModel.timerStart()
        }
        .padding(.horizontal, 16)
        .stBackground()
        .configBackButton(dismiss: dismiss)
        .navigate(
            to: renewalPasswordComponent.makeView(
                renewalPasswordSceneParam: .init(
                    employeeID: viewModel.findPasswordVerifySceneParam.employeeID,
                    email: viewModel.findPasswordVerifySceneParam.email
                )
            ),
            when: $viewModel.isNavigateRenewalPassword
        )
        .stToast(isShowing: $viewModel.isToastShow, message: "입력하신 이메일로 인증번호를 전송했어요", icon: .success)
    }
}
