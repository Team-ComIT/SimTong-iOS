import DesignSystem
import SwiftUI
import SigninFeature
import SignupFeature

struct IntroView: View {
    @StateObject var viewModel: IntroViewModel
    private let signinComponent: SigninComponent
    private let signupVerifyComponent: SignupVerifyComponent

    public init(
        viewModel: IntroViewModel,
        signinComponent: SigninComponent,
        signupVerifyComponent: SignupVerifyComponent
    ) {
        _viewModel = StateObject(wrappedValue: viewModel)
        self.signinComponent = signinComponent
        self.signupVerifyComponent = signupVerifyComponent
    }

    var body: some View {
        ZStack {
            STImage(viewModel.places[viewModel.currentIndex])
                .ignoresSafeArea()

            VStack {
                VStack(alignment: .center, spacing: 0) {
                    Text("마음을 나누다.")
                        .font(Font(
                            uiFont: .init(
                                font: DesignSystemFontFamily.SuseongHyejeong.regular,
                                size: 18
                            ) ?? .init())
                        )
                        .foregroundColor(.gray04)

                    STImage(.introLogo)
                        .frame(width: 156, height: 53)
                }
                .padding(.top, 24)

                Spacer()

                VStack(spacing: 16) {
                    CTAButton(text: "회원가입") {
                        viewModel.isNavigateSignup = true
                    }

                    CTAButton(text: "로그인", style: .cancel) {
                        viewModel.isNavigateSignin = true
                    }
                }
                .padding(.horizontal, 16)
                .padding(.bottom, 8)
            }
        }
        .navigate(
            to: signinComponent.makeView(),
            when: $viewModel.isNavigateSignin
        )
        .navigate(
            to: VStack(content: {
                NavigationLink {
                    signupVerifyComponent.makeView(signupVerifySceneParam: .init(name: "", employeeID: "", email: ""))
                } label: {
                    Text("A")
                }

            }),
            when: $viewModel.isNavigateSignup
        )
    }
}
