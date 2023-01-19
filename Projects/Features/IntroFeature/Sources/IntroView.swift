import BaseFeature
import DesignSystem
import SwiftUI
import SigninFeature
import SignupFeature

struct IntroView: View {
    @StateObject var viewModel: IntroViewModel
    @EnvironmentObject var appState: AppState
    private let signinComponent: SigninComponent
    private let signupEmployeeInfoComponent: SignupEmployeeInfoComponent

    public init(
        viewModel: IntroViewModel,
        signinComponent: SigninComponent,
        signupEmployeeInfoComponent: SignupEmployeeInfoComponent
    ) {
        _viewModel = StateObject(wrappedValue: viewModel)
        self.signinComponent = signinComponent
        self.signupEmployeeInfoComponent = signupEmployeeInfoComponent
    }

    var body: some View {
        ZStack {
            STImage(.sungsimdangCharacter)
                .frame(width: 259, height: 324)

            VStack(spacing: 12) {
                VStack(spacing: 4) {
                    STImage(.miniSimtong)
                        .frame(width: 50, height: 54)

                    STImage(.simtongTypo)
                        .frame(width: 71, height: 30)

                    Text("마음을 나누다.")
                        .font(Font(
                            uiFont: .init(
                                font: DesignSystemFontFamily.SuseongHyejeong.regular,
                                size: 18
                            ) ?? .init())
                        )
                        .foregroundColor(.gray04)
                }
                .padding(.top, 8)

                Spacer()

                CTAButton(text: "회원가입") {
                    viewModel.isNavigateSignup = true
                }

                CTAButton(text: "로그인", style: .cancel) {
                    viewModel.isNavigateSignin = true
                }
                .padding(.bottom, 32)
            }
            .padding(.horizontal, 16)
        }
        .onAppear {
            hideKeyboard()
        }
        .navigationBarTitleDisplayMode(.inline)
        .navigate(
            to: signinComponent.makeView(),
            when: $viewModel.isNavigateSignin
        )
        .navigate(
            to: signupEmployeeInfoComponent.makeView(),
            when: $viewModel.isNavigateSignup
        )
    }
}
