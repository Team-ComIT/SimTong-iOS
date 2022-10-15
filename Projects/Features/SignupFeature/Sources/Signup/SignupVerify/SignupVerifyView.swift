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
                    viewModel.isToastShow = true
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

                WideButton(text: "확인") {
                    viewModel.certificationNumberVerify()
                }
                    .disabled(viewModel.certificationNumber.isEmpty)
                    .navigate(to: SignupPasswordView(viewModel: SignupPasswordViewmodel()), when: $viewModel.verify)
            }
        }
        .stBackground()
        .configBackButton(dismiss: dismiss)
        .navigationTitle("회원가입")
        .stToast(isShowing: $viewModel.isToastShow, message: "입력하신 이메일로 인증번호를 전송했어요", icon: .success)
    }
}
