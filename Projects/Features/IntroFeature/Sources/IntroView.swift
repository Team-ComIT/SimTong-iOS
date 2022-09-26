import SwiftUI
import DesignSystem

struct IntroView: View {
    @StateObject var viewModel: IntroViewModel

    public init(
        viewModel: IntroViewModel
    ) {
        _viewModel = StateObject(wrappedValue: viewModel)
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
                    CTAButton(text: "회원가입") {}

                    CTAButton(text: "로그인", style: .cancel) {}
                }
                .padding(.horizontal, 16)
                .padding(.bottom, 8)
            }
        }
        .preferredColorScheme(.dark)
    }
}

struct IntroView_Previews: PreviewProvider {
    static var previews: some View {
        IntroView(viewModel: IntroViewModel())
    }
}
