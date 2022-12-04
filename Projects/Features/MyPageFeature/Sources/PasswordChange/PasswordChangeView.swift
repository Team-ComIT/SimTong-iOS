import SwiftUI
import FindPasswordFeature
import DesignSystem

struct PasswordChangeView: View {
    @StateObject var viewModel: PasswordChangeViewModel
    @FocusState var focusField: Bool
    @Environment(\.dismiss) var dismiss
    private let findPasswordInfoComponent: FindPasswordInfoComponent

    public init(
        viewModel: PasswordChangeViewModel,
        findPasswordInfoComponent: FindPasswordInfoComponent
    ) {
        _viewModel = StateObject(wrappedValue: viewModel)
        self.findPasswordInfoComponent = findPasswordInfoComponent
    }

    var body: some View {
        ZStack {
            VStack {
                STSecureTextField(
                    "따뜻한_아이스티",
                    labelText: "비밀번호",
                    text: $viewModel.password,
                    style: .clear,
                    errorText: viewModel.errorMessage,
                    isError: viewModel.isError,
                    onCommit: {
                        viewModel.changeButtonDidTap()
                    }
                )
                .focused($focusField)
                .padding([.top, .horizontal])

                HStack {
                    Text("비밀번호를 잊으셨나요?")
                        .stTypo(.r7)
                        .foregroundColor(.gray05)

                    Button {
//                        NavigationUtil.popToRootView()
                    } label: {
                        Text("비밀번호 찾기")
                            .underline()
                            .stTypo(.r7)
                            .foregroundColor(.gray05)
                    }
                }

                Spacer()

                WideButton(text: "다음") {
                    viewModel.changeButtonDidTap()
                }
                .disabled(viewModel.password.isEmpty)
            }
        }
        .onAppear {
            focusField = true
        }
//        .onChange(of: viewModel.isSuccessPasswordChange) { newValue in
//            if newValue {
//                dismiss()
//            }
//        }
        .navigationTitle("비밀번호 수정하기")
        .navigationBarTitleDisplayMode(.inline)
        .stBackground()
        .configBackButton(dismiss: dismiss)
    }
}
