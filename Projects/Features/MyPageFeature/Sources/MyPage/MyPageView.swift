import DesignSystem
import BaseFeature
import SwiftUI

struct MyPageView: View {
    @StateObject var viewModel: MyPageViewModel
    @Environment(\.dismiss) var dismiss
    @EnvironmentObject var appState: AppState
    private let nicknameChangeComponent: NicknameChangeComponent
    private let emailModifyComponent: EmailModifyComponent
    private let spotChangeComponent: SpotChangeComponent
    private let passwordCheckComponent: PasswordCheckComponent

    public init(
        viewModel: MyPageViewModel,
        nicknameChangeComponent: NicknameChangeComponent,
        emailModifyComponent: EmailModifyComponent,
        spotChangeComponent: SpotChangeComponent,
        passwordCheckComponent: PasswordCheckComponent
    ) {
        _viewModel = StateObject(wrappedValue: viewModel)
        self.nicknameChangeComponent = nicknameChangeComponent
        self.emailModifyComponent = emailModifyComponent
        self.spotChangeComponent = spotChangeComponent
        self.passwordCheckComponent = passwordCheckComponent
    }

    var body: some View {
        VStack {
            Button {
                viewModel.profileButtonDidTap()
            } label: {
                ZStack(alignment: .bottomTrailing) {
                    if let selectedImage = viewModel.selectedImage {
                        Image(uiImage: selectedImage)
                            .resizable()
                            .frame(width: 100, height: 100)
                            .clipShape(Circle())
                    } else {
                        AsyncImage(url: URL(string: viewModel.myProfile.profileImagePath)) { image in
                            image
                                .resizable()
                                .foregroundColor(.gray04)
                                .frame(width: 100, height: 100)
                        } placeholder: {
                            Color.gray01
                                .frame(width: 100, height: 100)
                        }
                        .clipShape(Circle())
                    }

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
                    viewModel.emailButtonDidTap()
                }

                formTextRow(key: "근무 지점", text: viewModel.myProfile.spot) {
                    viewModel.spotButtonDidTap()
                }

                Button {
                    viewModel.changePasswordButtonDidTap()
                } label: {
                    formImageRow(key: "비밀번호 변경") {
                    Image(systemName: "chevron.right")
                        .resizable()
                        .frame(width: 8, height: 13)
                        .foregroundColor(.gray07)
                    }
                }
                .disabled(!viewModel.isModify)

                HStack {
                    Button {
                        viewModel.logoutButtonDidTap()
                    } label: {
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
            }
            .padding(.top, 24)

            Spacer()
        }
        .redacted(reason: viewModel.isSkeleton ? .placeholder : [])
        .imagePicker(isShow: $viewModel.isPresentedImagePicker, completion: { image in
            viewModel.changeProfileImage(image: image)
        }, uiImage: $viewModel.selectedImage)
        .navigationBarTitleDisplayMode(.inline)
        .navigationTitle(Text("프로필"))
        .toolbar {
            ToolbarItemGroup(placement: .navigationBarTrailing) {
                Button {
                    viewModel.modify()
                    if !viewModel.isModify {
                        Task {
                            await viewModel.loadMyInfo()
                        }
                    }
                } label: {
                    Text(viewModel.isModify ? "완료" : "수정")
                        .stTypo(.m6, color: .main)
                }
            }
        }
        .configBackButton(dismiss: dismiss)
        .padding(.horizontal, 24)
        .stBackground()
        .task {
            await viewModel.loadMyInfo()
        }
        .navigate(
            to: nicknameChangeComponent.makeView(),
            when: $viewModel.isNavigateNickname
        )
        .navigate(
            to: emailModifyComponent.makeView(),
            when: $viewModel.isNavigateEmail
        )
        .fullScreenCover(isPresented: $viewModel.isNaivgateSpot) {
            spotChangeComponent.makeView(selectedSpot: viewModel.myProfile.spot) { spot in
                viewModel.spotDidSelect(spotName: spot.name)
            }
        }
        .navigate(
            to: passwordCheckComponent.makeView(),
            when: $viewModel.isNavigatePassword
        )
        .alert("로그아웃", isPresented: $viewModel.isLogout) {
            Button("취소", role: .cancel) {}
            Button("확인", role: .destructive) {
                viewModel.logoutCheckButtonDidTap()
                withAnimation {
                    appState.sceneFlow = .intro
                }
            }
        } message: {
            Text("로그아웃을 하더라도 데이터가 삭제되지 않습니다.")
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
