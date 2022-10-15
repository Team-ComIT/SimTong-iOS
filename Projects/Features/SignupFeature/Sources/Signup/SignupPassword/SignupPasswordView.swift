import SwiftUI
import DesignSystem

struct SignupPasswordView: View {
    private enum FocusField: Hashable {
        case password
        case passwordCheck
    }

    @StateObject var viewModel: SignupPasswordViewmodel
    @FocusState private var focusField: FocusField?
    @Environment(\.dismiss) var dismiss

    public init(
        viewModel: SignupPasswordViewmodel
    ) {
        _viewModel = StateObject(wrappedValue: viewModel)
    }

    var body: some View {
        ZStack {
            VStack {
                if viewModel.isShowPasswordCheck {
                    STSecureTextField(
                        labelText: "비밀번호 재확인",
                        text: $viewModel.passwordCheck,
                        errorText: "정보가 일치 하지 않습니다"
                        )
                    .focused($focusField, equals: .passwordCheck)
                    .opacity(viewModel.isShowPasswordCheck ? 1.0 : 0.0)
                    .keyboardType(.numberPad)
                    .padding()
                }

                STSecureTextField(
                    labelText: "비밀번호 설정",
                    text: $viewModel.password,
                    onCommit: {
                        withAnimation {
                            viewModel.nextButtonDidTap()
                        }
                    })
                    .padding([.top, .horizontal])

                HStack {
                    Text("계정이 있으신가요?")
                        .stTypo(.r7)
                        .foregroundColor(.gray05)
                    NavigationLink {
                        Text("안녕하세용")
                    } label: {
                        Text("로그인")
                            .underline()
                            .stTypo(.r7)
                            .foregroundColor(.gray05)
                    }
                }
                .padding(.top, 32)

                Spacer()

                WideButton(text: "다음") {
                    withAnimation {
                        viewModel.nextButtonDidTap()
                    }
                }
                .disabled(viewModel.password.isEmpty)
                .navigate(
                    to: SignupPasswordView(viewModel: SignupPasswordViewmodel()),
                    when: $viewModel.isPasswordCheck
                )
            }
        }
        .stBackground()
        .configBackButton(dismiss: dismiss)
        .navigationTitle("회원가입")
    }
}
