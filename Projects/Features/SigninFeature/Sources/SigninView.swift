import SwiftUI
import DesignSystem
import FindTabFeature

struct SigninView: View {

    @StateObject var viewModel: SigninViewModel
    @Environment(\.dismiss) var dismiss
    private let findAuthInfoTabComponent: FindAuthInfoTabComponent

    public init(
        viewModel: SigninViewModel,
        findAuthInfoTabComponent: FindAuthInfoTabComponent
    ) {
        _viewModel = StateObject(wrappedValue: viewModel)
        self.findAuthInfoTabComponent = findAuthInfoTabComponent
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

                STImage(.signinLogo)
                    .frame(width: 156, height: 53)

                STTextField(
                    text: $viewModel.employeeID,
                    errorText: viewModel.errorMessage,
                    isError: viewModel.isError
                )
            }
            .padding(.top, 24)
        }
    }
}
