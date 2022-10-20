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
            HStack {
                Text("회원가입")
                    .stTypo(.s3)
                    .padding()

                Spacer()
            }

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

            STTextField(
                labelText: "닉네임 설정",
                text: $viewModel.nickname,
                style: .clear,
                errorText: viewModel.errorMessage,
                isError: viewModel.isError
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
                viewModel.isNotSupportImageType = true
            }
        }
        .imagePicker(isShow: $viewModel.isShowImage, uiImage: $viewModel.image)
        .stBackground()
        .configBackButton(dismiss: dismiss)
        .stSnackbar(isShowing: $viewModel.isNotSupportImageType, text: "지원하지 않는 파일 형식입니다")
    }
}
