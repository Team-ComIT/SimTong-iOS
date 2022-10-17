import SwiftUI
import DesignSystem

struct SignupInfoView: View {

    @StateObject var viewModel: SignupInfoViewModel
    @Environment(\.dismiss) var dismiss

    public init(
        viewModel: SignupInfoViewModel
    ) {
        _viewModel = StateObject(wrappedValue: viewModel)
    }

    var body: some View {
            VStack {
                Button {
                    viewModel.isShowImage.toggle()
                } label: {
                    Group {
                        if let image = viewModel.image {
                            Image(uiImage: image)
                                .resizable()
                        } else {
                            Image(systemName: "plus")
                        }
                    }
                    .tint(Color.gray05)
                    .frame(width: 100, height: 100)
                    .background(Color.gray02)
                }
                .clipShape(Circle())
                .imagePicker(isShow: $viewModel.isShowImage, uiImage: $viewModel.image)

                STTextField(
                    labelText: "닉네임 설정",
                    text: $viewModel.nickname,
                    style: .clear
                )
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
                WideButton(text: viewModel.isSkip ? "건너뛰기" : "다음") {
                }
            }
        .stBackground()
        .configBackButton(dismiss: dismiss)
        .navigationTitle("회원가입")
    }
}
