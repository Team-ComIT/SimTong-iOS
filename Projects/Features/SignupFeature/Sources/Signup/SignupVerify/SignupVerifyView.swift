import SwiftUI
import DesignSystem

struct SignupVerifyView: View {
    private enum FocusField {
        case code
    }
    @StateObject var viewModel: SignupVerifyViewModel
    @Environment(\.dismiss) var dismiss
    private let signupPasswordComponent: SignupPasswordComponent
    @FocusState private var focusField: FocusField?

    public init(
        viewModel: SignupVerifyViewModel,
        signupPasswordComponent: SignupPasswordComponent
    ) {
        _viewModel = StateObject(wrappedValue: viewModel)
        self.signupPasswordComponent = signupPasswordComponent
        viewModel.timerStart()
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
                    text: $viewModel.authCode,
                    style: .clear,
                    errorText: viewModel.errorMessage,
                    isError: viewModel.isError, onCommit: {
                        viewModel.completeButtonDidTap()
                    }
                )
                .focused($focusField, equals: .code)

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
            .disabled(viewModel.authCode.isEmpty)
        }
        .onAppear {
            focusField = .code
        }
        .navigate(
            to: signupPasswordComponent.makeView(
                signupPasswordSceneParam: .init(
                    name: viewModel.signupVerifySceneParam.name,
                    employeeID: viewModel.signupVerifySceneParam.employeeID,
                    email: viewModel.signupVerifySceneParam.email
                )
            ),
            when: $viewModel.isVerified
        )
        .stBackground()
        .configBackButton(dismiss: dismiss)
        .stToast(isShowing: $viewModel.isToastShow, message: "입력하신 이메일로 인증번호를 전송했어요", icon: .success)
    }
}
