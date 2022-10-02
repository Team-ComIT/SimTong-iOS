import SwiftUI
import DesignSystem

struct SignupView: View {

    @StateObject var viewModel: SignupViewModel

    public init(
        viewModel: SignupViewModel
    ) {
        _viewModel = StateObject(wrappedValue: viewModel)
    }

    var body: some View {
        ZStack {
            VStack {
                HStack {
                    Text("회원가입")
                        .stTypo(.m3)
                        .padding(16)
                    Spacer()
                }
                STTextField(labelText: "이름", text: $viewModel.nameText)
                    .padding(16)
                Spacer()
            }
        }
        .background(Color.extraBackground)
    }

}
