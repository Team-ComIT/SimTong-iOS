import SwiftUI
import DesignSystem

struct NicknameModifyView: View {
    @StateObject var viewModel: NicknameModifyViewModel
    @FocusState var focusField: Bool
    @Environment(\.dismiss) var dismiss

    public init(
        viewModel: NicknameModifyViewModel
    ) {
        _viewModel = StateObject(wrappedValue: viewModel)
    }

    var body: some View {
        ZStack {
            VStack {
                STTextField(
                    "따뜻한_아이스티",
                    labelText: "닉네임",
                    text: $viewModel.nickname,
                    style: .clear,
                    errorText: viewModel.errorMessage,
                    isError: viewModel.isError,
                    onCommit: {
                        viewModel.modifyButtonDidTap()
                    }
                )
                .focused($focusField)
                .padding([.top, .horizontal])

                Spacer()

                WideButton(text: "닉네임 변경") {
                    viewModel.modifyButtonDidTap()
                }
                .disabled(viewModel.nickname.isEmpty)
            }
        }
        .onAppear {
            focusField = true
        }
        .onChange(of: viewModel.isSuccessNicknameModify) { newValue in
            if newValue {
                dismiss()
            }
        }
        .navigationTitle("닉네임 수정하기")
        .navigationBarTitleDisplayMode(.inline)
        .stBackground()
        .configBackButton(dismiss: dismiss)
    }
}