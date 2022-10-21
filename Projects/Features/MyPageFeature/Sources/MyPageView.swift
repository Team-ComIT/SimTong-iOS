import DesignSystem
import SwiftUI

struct MyPageView: View {
    @StateObject var viewModel: MyPageViewModel
    @Environment(\.dismiss) var dismiss
    @State var isPresentedImagePicker = false

    public init(
        viewModel: MyPageViewModel
    ) {
        _viewModel = StateObject(wrappedValue: viewModel)
    }

    var body: some View {
        VStack {
            Button {
                isPresentedImagePicker.toggle()
            } label: {
                ZStack(alignment: .bottomTrailing) {
                    AsyncImage(url: URL(string: viewModel.myProfile.profileImagePath)) { image in
                        image
                            .resizable()
                            .foregroundColor(.gray04)
                            .frame(width: 100, height: 100)
                    } placeholder: {
                        Color.gray01
                    }
                    .clipShape(Circle())

                    Image(systemName: "camera.fill")
                        .resizable()
                        .frame(width: 15, height: 12)
                        .foregroundColor(.gray04)
                        .padding(7)
                        .background {
                            Color.gray02
                                .clipShape(Circle())
                                .overlay {
                                    Circle()
                                        .stroke(Color.extraBackground, lineWidth: 4)
                                }
                        }
                        .unredacted()
                        .padding([.bottom, .trailing], 4)
                }
            }
            .disabled(viewModel.isSkeleton)
            .padding(.top, 24)

            VStack(spacing: 24) {
                formTextRow(key: "닉네임", text: viewModel.myProfile.nickname) {}

                formTextRow(key: "이름", text: viewModel.myProfile.name) {}

                formTextRow(key: "이메일", text: viewModel.myProfile.email) {}

                formTextRow(key: "근무 지점", text: viewModel.myProfile.spot) {}

                formImageRow(key: "비밀번호 변경") {
                    Image(systemName: "chevron.right")
                        .resizable()
                        .frame(width: 8, height: 13)
                        .foregroundColor(.gray07)
                }

                HStack {
                    Text("로그아웃")
                        .stTypo(.r5, color: .extraError)
                        .unredacted()

                    Spacer()

                    Image(systemName: "chevron.right")
                        .resizable()
                        .frame(width: 8, height: 13)
                        .foregroundColor(.gray07)
                        .unredacted()
                }
            }
            .padding(.top, 24)

            Spacer()
        }
        .redacted(reason: viewModel.isSkeleton ? .placeholder : [])
        .imagePicker(isShow: $isPresentedImagePicker, uiImage: $viewModel.selectedImage)
        .navigationBarTitleDisplayMode(.inline)
        .navigationTitle(Text("프로필"))
        .configBackButton(dismiss: dismiss)
        .padding(.horizontal, 24)
        .stBackground()
    }

    @ViewBuilder
    func formTextRow(
        key: String,
        text: String,
        onTapGesture: @escaping () -> Void
    ) -> some View {
        HStack {
            Text(key)
                .stTypo(.r5, color: .extraBlack)
                .unredacted()

            Spacer()

            Text(text)
                .stTypo(.r5, color: .gray07)
                .onTapGesture(perform: onTapGesture)
        }
    }

    func formImageRow(
        key: String,
        @ViewBuilder image: () -> some View
    ) -> some View {
        HStack {
            Text(key)
                .stTypo(.r5, color: .extraBlack)
                .unredacted()

            Spacer()

            image()
                .unredacted()
        }
    }
}
