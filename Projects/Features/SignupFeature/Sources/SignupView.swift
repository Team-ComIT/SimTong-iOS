import SwiftUI
import Foundation
import DesignSystem
import Combine

struct SignupView: View {
    private enum FocusField: Hashable {
        case name
        case number
        case email
    }

    @StateObject var viewModel: SignupViewModel
    @FocusState private var focusField: FocusField?
//    @Environment(\.dismiss) var dismiss

    public init(
        viewModel: SignupViewModel
    ) {
        _viewModel = StateObject(wrappedValue: viewModel)
    }

    var body: some View {
        ZStack {
            ScrollView {
                VStack {
                    Group {
                        if viewModel.isEmailStep {
                            STTextField(
                                "yoonhd81@sungsimdang.co.kr",
                                labelText: "이메일",
                                text: $viewModel.email,
                                style: .clear,
                                onCommit: {
                                    viewModel.nextButtonDidTap()
                                })
                            .focused($focusField, equals: .email)
                            .opacity(viewModel.isEmailStep ? 1.0 : 0.0)
                        }

                        if viewModel.isNumberStep {
                            STTextField(
                                "1234567890",
                                labelText: "사원번호",
                                text: $viewModel.number,
                                style: .clear,
                                onCommit: {
                                    withAnimation {
                                        viewModel.nextButtonDidTap()
                                        focusField = .email
                                    }
                                })
                            .focused($focusField, equals: .number)
                            .opacity(viewModel.isNumberStep ? 1.0 : 0.0)
                            .keyboardType(.numberPad)
                        }

                        STTextField(
                            "예시: 최형우",
                            labelText: "이름",
                            text: $viewModel.name,
                            style: .clear,
                            onCommit: {
                                withAnimation {
                                    viewModel.nextButtonDidTap()
                                    focusField = .number
                                }
                            })
                        .focused($focusField, equals: .name)
                    }
                    .padding(.horizontal, 16)
                    .padding(.vertical, 10)

                    HStack {
                        Text("계정이 있으신가요?")
                            .stTypo(.r7)
                            .foregroundColor(.gray05)

                        NavigationLink {
                            PasswordView()
                        } label: {
                            Text("로그인")
                                .underline()
                                .stTypo(.r7)
                                .foregroundColor(.gray05)
                        }
                    }

                    Spacer()
                }
                .navigationBarTitle("회원가입")
            }

            VStack {
                Spacer()

                WideButton(text: viewModel.nextButtonTitle) {
                    Task {
                        await viewModel.signup()
                    }
                    withAnimation {
                        viewModel.nextButtonDidTap()
                    }
                }
                .disabled(!viewModel.isEnableNextButton)
            }
        }
//        .configBackButton(willDismiss: {
//            viewModel.isPresentedTerms = false
//        }, dismiss: dismiss)
        .stBackground()
        .onAppear {
            focusField = .name
        }
        .adaptiveSheet(isPresented: $viewModel.isPresentedTerms, detents: [.medium(), .large()]) {
            TermsView {
                viewModel.isPresentedTerms = false
//                viewModel.isNavigateToVerify.toggle()
            }
        }
    }
}

struct PasswordView: View {
    var body: some View {
        HStack {
        }
    }
}
