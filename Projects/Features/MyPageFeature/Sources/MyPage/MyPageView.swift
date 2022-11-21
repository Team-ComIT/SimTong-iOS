import DesignSystem
import SwiftUI

struct MyPageView: View {
    @StateObject var viewModel: MyPageViewModel
    @Environment(\.dismiss) var dismiss
    @State var isPresentedImagePicker = false
    @StateObject var test = MyPageRouteBuilder()
    private let nicknameModifyComponent: NicknameModifyComponent
    private let emailModifyComponent: EmailModifyComponent

    public init(
        viewModel: MyPageViewModel,
        nicknameModifyComponent: NicknameModifyComponent,
        emailModifyComponent: EmailModifyComponent
    ) {
        _viewModel = StateObject(wrappedValue: viewModel)
        self.nicknameModifyComponent = nicknameModifyComponent
        self.emailModifyComponent = emailModifyComponent
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
                formTextRow(key: "닉네임", text: viewModel.myProfile.nickname) {
                    viewModel.nicknameButtonDidTap()
                }

                formTextRow(key: "이름", text: viewModel.myProfile.name) {}

                formTextRow(key: "이메일", text: viewModel.myProfile.email) {
                    test.routeBuilder = true
                    viewModel.emailButtonDidTap()
                }

                formTextRow(key: "근무 지점", text: viewModel.myProfile.spot) {
                    print("근무 지점 누름")
                }

                formImageRow(key: "비밀번호 변경") {
                    Image(systemName: "chevron.right")
                        .resizable()
                        .frame(width: 8, height: 13)
                        .foregroundColor(.gray07)
                }

                HStack {
                    Text("로그아웃")
                        .stTypo(.r5, color: .main)
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
        .navigationBarItems(trailing:
            Button {
                viewModel.modify()
            } label: {
                Text(viewModel.isModify ? "완료" : "수정")
                    .stTypo(.m6, color: .main)
            }
        )
        .configBackButton(dismiss: dismiss)
        .padding(.horizontal, 24)
        .stBackground()
        .task {
            await viewModel.loadMyInfo()
        }
        .navigate(to: nicknameModifyComponent.makeView(), when: $viewModel.isNavigateNickname)
        .navigate(
            to: emailModifyComponent.makeView()
                .environmentObject(test),
            when: $test.routeBuilder
        )
//        .onChange(of: viewModel.isNavigateEmail) { newValue in
//            print(newValue)
//            test.routeBuilder = newValue
//        }
        .onChange(of: test.routeBuilder) { newValue in
            print("rou", newValue)
        }
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