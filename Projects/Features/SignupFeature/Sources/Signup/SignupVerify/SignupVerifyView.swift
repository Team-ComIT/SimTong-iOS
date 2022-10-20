import SwiftUI
import DesignSystem

struct SignupVerifyView: View {

    @StateObject var viewModel: SignupVerifyViewModel
    @Environment(\.dismiss) var dismiss
    private let signupPasswordComponent: SignupPasswordComponent

    public init(
        viewModel: SignupVerifyViewModel,
        signupPasswordComponent: SignupPasswordComponent
    ) {
        _viewModel = StateObject(wrappedValue: viewModel)
        self.signupPasswordComponent = signupPasswordComponent
    }

    var body: some View {
        VStack {
            HStack {
                Text("회원가입")
                    .stTypo(.s3)
                    .padding()

                Spacer()
            }

            ZStack(alignment: .topTrailing) {
                STTextField(
                    "이메일을 확인해보세요!",
                    labelText: "인증번호",
                    text: $viewModel.certificationNumber,
                    style: .clear,
                    errorText: viewModel.errorMessage,
                    isError: viewModel.isError, onCommit: {
                        viewModel.completeButtonDidTap()
                    }
                )

                Text("남은시간 \(viewModel.timeText)")
                    .stTypo(.m6, color: .extraError)
            }
            .padding(.horizontal, 16)

            CTAButton(text: "재발송", style: .cancel) {
                viewModel.resendCodeButtonDidTap()
            }
            .padding(.top, 8)
            .padding(.horizontal, 16)

            HStack {
                Text("계정이 있으신가요?")
                    .stTypo(.r7)
                    .foregroundColor(.gray05)

                NavigationLink {
                    Text("안녕하세용")
                } label: {
                    Text("로그인")
                        .underline()
                        .stTypo(.r7)
                        .foregroundColor(.gray05)
                }
            }
            .padding(.top, 32)

            Spacer()

            WideButton(text: "확인") {
                viewModel.completeButtonDidTap()
            }
            .disabled(viewModel.certificationNumber.isEmpty)
        }
        .navigate(to: signupPasswordComponent.makeView(), when: $viewModel.isVerified)
        .stBackground()
        .configBackButton(dismiss: dismiss)
        .stToast(isShowing: $viewModel.isToastShow, message: "입력하신 이메일로 인증번호를 전송했어요", icon: .success)
        .onAppear {
            viewModel.timerStart()
        }
    }
}
