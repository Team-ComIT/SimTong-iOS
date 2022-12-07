import SwiftUI
import FindPasswordFeature
import DesignSystem
import DomainModule

struct PasswordCheckView: View {
    @StateObject var viewModel: PasswordCheckViewModel
    @FocusState var focusField: Bool
    @Environment(\.dismiss) var dismiss
    private let findPasswordInfoComponent: FindPasswordInfoComponent
    private let passwordChangeComponent: PasswordChangeComponent

    public init(
        viewModel: PasswordCheckViewModel,
        findPasswordInfoComponent: FindPasswordInfoComponent,
        passwordChangeComponent: PasswordChangeComponent
    ) {
        _viewModel = StateObject(wrappedValue: viewModel)
        self.findPasswordInfoComponent = findPasswordInfoComponent
        self.passwordChangeComponent = passwordChangeComponent
    }

    var body: some View {
        ZStack {
            VStack {
                STSecureTextField(
                    labelText: "비밀번호",
                    text: $viewModel.password,
                    errorText: viewModel.errorMessage,
                    isError: viewModel.isError,
                    onCommit: {
                        viewModel.checkButtonDidTap()
                    }
                )
                .focused($focusField)
                .padding([.top, .horizontal])

                HStack {
                    Text("비밀번호를 잊으셨나요?")
                        .stTypo(.r7)
                        .foregroundColor(.gray05)

                    Button {
                        viewModel.isNavigateFindPassword = true
                    } label: {
                        Text("비밀번호 찾기")
                            .underline()
                            .stTypo(.r7)
                            .foregroundColor(.gray05)
                    }
                }
                .padding(.top, 32)

                Spacer()

                WideButton(text: "다음") {
                    viewModel.checkButtonDidTap()
                }
                .disabled(viewModel.password.isEmpty)
            }
        }
        .onAppear {
            focusField = true
        }
        .navigate(
            to: findPasswordInfoComponent.makeView(),
            when: $viewModel.isNavigateFindPassword
        )
        .navigate(
            to: passwordChangeComponent.makeView(password: viewModel.password),
            when: $viewModel.isSuccessPasswordCheck
        )
        .navigationTitle("비밀번호 수정하기")
        .navigationBarTitleDisplayMode(.inline)
        .stBackground()
        .configBackButton(dismiss: dismiss)
    }
}
