import SwiftUI
import DesignSystem

struct SigninView: View {

    @StateObject var viewModel: SigninViewModel
    @Environment(\.dismiss) var dismiss

    public init(
        viewModel: SigninViewModel
    ) {
        _viewModel = StateObject(wrappedValue: viewModel)
    }

    var body: some View {
        VStack {
            VStack(alignment: .center) {
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
        }
    }
}
