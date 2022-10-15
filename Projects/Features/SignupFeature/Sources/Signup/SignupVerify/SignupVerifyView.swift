import SwiftUI
import DesignSystem

struct SignupVerifyView: View {

    @StateObject var viewModel: SignupVerifyViewModel
    @Environment(\.dismiss) var dismiss

    public init(
        viewModel: SignupVerifyViewModel
    ) {
        _viewModel = StateObject(wrappedValue: viewModel)
    }

    var body: some View {
        ZStack {
            HStack {
                VStack {
                    ZStack(alignment: .topTrailing) {
                        STTextField(
                            "이메일을 확인해보세요!",
                            labelText: "인증번호",
                            text: $viewModel.certificationNumber,
                            style: .clear
                        )
                            .padding([.top, .horizontal])
                            .padding(.bottom, 8)
                        Text(viewModel.timeRemaining)
                            .stTypo(.m6, color: .extraError)
                            .padding()
                            .onAppear {
                                viewModel.updateTimeRemaining()
                            }
                            .onReceive(viewModel.timer) { _ in
                                withAnimation(.default) {
                                    viewModel.count = viewModel.count == 5 ? 1 : viewModel.count + 1
                                }
                                viewModel.updateTimeRemaining()
                            }
                    }

                    CTAButton(text: "재발송", style: .cancel, action: {
                        viewModel.futureData = Calendar.current.date(byAdding: .minute, value: 5, to: Date()) ?? Date()
                    })
                        .padding(.horizontal)
                        .cornerRadius(5)
                        .shadow(color: .gray02, radius: 5, x: 0, y: 5)

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
                    WideButton(text: "확인")
                        .disabled(viewModel.certificationNumber.isEmpty)
                        .navigate(to: SignupVerifyView(viewModel: SignupVerifyViewModel()), when: $viewModel.isNavigateToVerify)
                }
            }
        }
        .stBackground()
        .configBackButton(dismiss: dismiss)
        .navigationTitle("회원가입")
    }
}
