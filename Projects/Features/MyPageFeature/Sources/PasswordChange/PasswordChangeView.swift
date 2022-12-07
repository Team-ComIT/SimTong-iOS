import SwiftUI
import FindPasswordFeature
import DesignSystem
import Utility

struct PasswordChangeView: View {
    private enum FocusField: Hashable {
        case password
        case checkPassword
    }
    @StateObject var viewModel: PasswordChangeViewModel
    @FocusState private var focusField: FocusField?
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

                if viewModel.isCheckPasswordStep {
                    STSecureTextField(
                        labelText: "비밀번호 재확인",
                        text: $viewModel.confirmPassword,
                        isError: viewModel.isError,
                        onCommit: {
                            viewModel.changeButtonDidTap()
                        }
                    )
                    .focused($focusField, equals: .checkPassword)
                    .opacity(viewModel.isCheckPasswordStep ? 1.0 : 0.0)
                    .padding([.top, .horizontal])
                }

                STSecureTextField(
                    "새로운 비밀번호를 입력해주세요.",
                    labelText: "비밀번호 변경",
                    text: $viewModel.newPassword,
                    errorText: viewModel.errorMessage,
                    isError: viewModel.isError,
                    onCommit: {
                        withAnimation {
                            viewModel.changeButtonDidTap()
                            focusField = .checkPassword
                        }
                    }
                )
                .focused($focusField, equals: .password)
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
                    withAnimation {
                        viewModel.changeButtonDidTap()
                    }
                }
                .disabled(!viewModel.isEnableChangeButton)
            }
        }
        .onAppear {
            focusField = .password
        }
        .onChange(of: viewModel.isSuccessPasswordChange) { newValue in
            if newValue {
                NavigationUtil.popToRootView()
            }
        }
        .navigate(
            to: findPasswordInfoComponent.makeView(),
            when: $viewModel.isNavigateFindPassword
        )
        .navigationTitle("비밀번호 수정하기")
        .navigationBarTitleDisplayMode(.inline)
        .stBackground()
        .configBackButton(dismiss: dismiss)
    }
}
