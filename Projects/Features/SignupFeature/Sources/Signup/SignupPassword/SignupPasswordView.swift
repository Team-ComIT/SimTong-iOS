import SwiftUI
import DesignSystem

struct SignupPasswordView: View {
    private enum FocusField: Hashable {
        case password
        case passwordCheck
    }

    @StateObject var viewModel: SignupPasswordViewModel
    @FocusState private var focusField: FocusField?
    @Environment(\.dismiss) var dismiss
    private let signupInfoComponent: SignupInfoComponent

    public init(
        viewModel: SignupPasswordViewModel,
        signupInfoComponent: SignupInfoComponent
    ) {
        _viewModel = StateObject(wrappedValue: viewModel)
        self.signupInfoComponent = signupInfoComponent
    }

    var body: some View {
        ZStack {
            VStack {
                HStack {
                    Text("회원가입")
                        .stTypo(.s3)
                        .padding()

                    Spacer()
                }

                if viewModel.isShowPasswordCheck {
                    STSecureTextField(
                        labelText: "비밀번호 재확인",
                        text: $viewModel.passwordCheck,
                        isError: viewModel.isError,
                        onCommit: {
                            withAnimation {
                                viewModel.nextButtonDidTap()
                                viewModel.checkPassword()
                            }
                        }
                    )
                    .focused($focusField, equals: .passwordCheck)
                    .opacity(viewModel.isShowPasswordCheck ? 1.0 : 0.0)
                    .padding()
                }

                STSecureTextField(
                    labelText: "비밀번호 설정",
                    text: $viewModel.password,
                    errorText: viewModel.errorMessage,
                    isError: viewModel.isError,
                    onCommit: {
                        withAnimation {
                            viewModel.nextButtonDidTap()
                        }
                        focusField = .passwordCheck
                    }
                )
                .focused($focusField, equals: .password)
                .padding([.top, .horizontal])

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

                WideButton(text: "다음") {
                    withAnimation {
                        viewModel.nextButtonDidTap()
                        viewModel.checkPassword()
                    }
                }
                .disabled(viewModel.password.isEmpty)
            }
        }
        .onAppear {
            focusField = .password
        }
        .navigate(
            to: signupInfoComponent.makeView(
                signupInfoSceneParam: .init(
                    name: viewModel.signupPasswordSceneParam.name,
                    employeeID: viewModel.signupPasswordSceneParam.employeeID,
                    email: viewModel.signupPasswordSceneParam.email,
                    password: viewModel.password
                )
            ),
            when: $viewModel.isNavigateSignupInfo
        )
        .stBackground()
        .configBackButton(dismiss: dismiss)
    }
}
