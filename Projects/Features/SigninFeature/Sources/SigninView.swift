import SwiftUI
import BaseFeature
import DesignSystem
import FindAuthInfoTabFeature
import SignupFeature

struct SigninView: View {
    private enum FoucusField: Hashable {
        case employeeID
        case password
    }

    @StateObject var viewModel: SigninViewModel
    @FocusState private var focusField: FoucusField?
    @Environment(\.dismiss) var dismiss
    @EnvironmentObject var appState: AppState
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
                    .foregroundColor(.gray05)
                    .padding(.top, 16)

                STImage(.signinLogo)
                    .frame(width: 156, height: 53)
                    .padding(.bottom, 16)

                STTextField(
                    "사원번호를 입력해주세요.",
                    text: $viewModel.employeeID,
                    isError: viewModel.isError,
                    onCommit: {
                        focusField = .password
                    }
                )
                .keyboardType(.numberPad)
                .padding(.bottom, 8)
                .focused($focusField, equals: .employeeID)

                STSecureTextField(
                    "비밀번호를 입력해주세요.",
                    text: $viewModel.password,
                    errorText: viewModel.errorMessage,
                    isError: viewModel.isError
                )
                .padding(.bottom, 32)
                .focused($focusField, equals: .password)

                CTAButton(text: "로그인") {
                    viewModel.signin()
                }
                .padding(.bottom, 16)
                .stTypo(.m5)
                .disabled(viewModel.isDisabledSignin)
            }
            .padding(.horizontal, 16)

            NavigationLink {
                findAuthInfoTabComponent.makeView()
            } label: {
                Text("사원번호 ∙ 비밀번호 찾기")
                    .stTypo(.r7, color: .gray05)
            }

            Spacer()

            HStack {
                Text("계정이 없으신가요?")
                    .stTypo(.r7, color: .gray05)

                NavigationLink {
                    signupEmployeeInfoComponent.makeView()
                } label: {
                    Text("회원가입")
                        .underline()
                        .stTypo(.r7, color: .gray05)
                }
            }
            .padding(.bottom, 24)
        }
        .stBackground()
        .configBackButton(dismiss: dismiss)
        .navigationBarTitleDisplayMode(.inline)
        .onChange(of: viewModel.isSuccessSignin) { newValue in
            if newValue {
                appState.sceneFlow = .main
            }
        }
    }
}
