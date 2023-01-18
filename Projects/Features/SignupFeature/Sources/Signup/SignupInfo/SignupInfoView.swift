import BaseFeature
import SwiftUI
import DesignSystem
import Utility

struct SignupInfoView: View {
    @StateObject var viewModel: SignupInfoViewModel
    @Environment(\.dismiss) var dismiss
    @EnvironmentObject var appState: AppState
    @State var isPresentedImagePicker = false

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
                isPresentedImagePicker.toggle()
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

                Button {
                    NavigationUtil.popToRootView()
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
                viewModel.nextButtonDidTap()
            }
        }
        .onChange(of: viewModel.isSuccessSignup) { newValue in
            if newValue {
                withAnimation {
                    appState.sceneFlow = .main
                }
            }
        }
        .imagePicker(isShow: $isPresentedImagePicker, uiImage: $viewModel.image)
        .stBackground()
        .configBackButton(dismiss: dismiss)
        .stSnackbar(isShowing: $viewModel.isNotSupportImageType, text: "지원하지 않는 파일 형식입니다")
        .stToast(isShowing: $viewModel.isError, message: viewModel.errorMessage)
    }
}
