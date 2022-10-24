import SwiftUI
import DesignSystem
import FindTabFeature
import SignupFeature

struct SigninView: View {

    @StateObject var viewModel: SigninViewModel
    @Environment(\.dismiss) var dismiss
    private let findAuthInfoTabComponent: FindAuthInfoTabComponent
    private let signupEmployeeInfoComponent: SignupEmployeeInfoComponent

    public init(
        viewModel: SigninViewModel,
        findAuthInfoTabComponent: FindAuthInfoTabComponent,
        signupEmployeeInfoComponent: SignupEmployeeInfoComponent
    ) {
        _viewModel = StateObject(wrappedValue: viewModel)
        self.findAuthInfoTabComponent = findAuthInfoTabComponent
        self.signupEmployeeInfoComponent = signupEmployeeInfoComponent
    }

    var body: some View {
        VStack {
            VStack(alignment: .leading, spacing: 0) {
                Text("마음을 나누다.")
                    .font(Font(
                        uiFont: .init(
                            font: DesignSystemFontFamily.SuseongHyejeong.regular,
                            size: 18
                        ) ?? .init())
                    )
                    .foregroundColor(.gray04)
                    .padding([.horizontal, .top], 16)

                STImage(.signinLogo)
                    .frame(width: 156, height: 53)
                    .padding([.horizontal, .bottom], 16)

                STTextField(
                    "사원번호를 입력해주세요.",
                    text: $viewModel.employeeID,
                    isError: viewModel.isError
                )
                .padding(.horizontal, 16)
                .padding(.bottom, 8)

                STSecureTextField(
                    "비밀번호를 입력해주세요.",
                    text: $viewModel.password,
                    errorText: viewModel.errorMessage,
                    isError: viewModel.isError
                )
                .padding(.horizontal, 16)
                .padding(.bottom, 32)

                CTAButton(text: "로그인") {
                    viewModel.signin()
                }
                    .padding([.horizontal, .bottom], 16)
                    .stTypo(.m5)
                    .disabled(viewModel.isCheckSignin)
            }

            NavigationLink {
                findAuthInfoTabComponent.makeView()
            } label: {
                Text("사원번호 ∙ 비밀번호 찾기")
                    .stTypo(.r7, color: .gray04)
            }

            Spacer()

            HStack {
                Text("계정이 없으신가요?")
                    .stTypo(.r7, color: .gray04)

                NavigationLink {
                    signupEmployeeInfoComponent.makeView()
                } label: {
                    Text("회원가입")
                        .stTypo(.r7, color: .gray04)
                }
            }
            .padding(.bottom, 24)
        }
        .navigate(to: Text("asdf"), when: $viewModel.isSignin)
        .configBackButton(dismiss: dismiss)
        .navigationBarTitleDisplayMode(.inline)
    }
}
