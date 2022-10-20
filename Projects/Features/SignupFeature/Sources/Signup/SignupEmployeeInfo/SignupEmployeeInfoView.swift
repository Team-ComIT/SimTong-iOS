import SwiftUI
import Foundation
import DesignSystem
import Combine

struct SignupEmployeeInfoView: View {
    private enum FocusField: Hashable {
        case name
        case number
        case email
    }

    @StateObject var viewModel: SignupEmployeeInfoViewModel
    @FocusState private var focusField: FocusField?
    @Environment(\.dismiss) var dismiss
    private let signupVerifyComponent: SignupVerifyComponent

    public init(
        viewModel: SignupEmployeeInfoViewModel,
        signupVerifyComponent: SignupVerifyComponent
    ) {
        _viewModel = StateObject(wrappedValue: viewModel)
        self.signupVerifyComponent = signupVerifyComponent
    }

    var body: some View {
        ZStack {
            ScrollView {
                VStack {
                    HStack {
                        Text("회원가입")
                            .stTypo(.s3)
                            .padding()

                        Spacer()
                    }

                    Group {
                        if viewModel.isEmailStep {
                            STTextField(
                                "yoonhd81@sungsimdang.co.kr",
                                labelText: "이메일",
                                text: $viewModel.email,
                                style: .clear,
                                isError: viewModel.isError,
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
                                isError: viewModel.isError,
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
                            errorText: viewModel.errorMessage,
                            isError: viewModel.isError,
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
                            Text("안녕하세용")
                        } label: {
                            Text("로그인")
                                .underline()
                                .stTypo(.r7)
                                .foregroundColor(.gray05)
                        }
                    }

                    Spacer()
                }
            }

            VStack {
                Spacer()

                WideButton(text: viewModel.nextButtonTitle) {
                    viewModel.signup()
                    withAnimation {
                        viewModel.nextButtonDidTap()
                    }
                }
                .disabled(!viewModel.isEnableNextButton)
            }
        }
        .stBackground()
        .onAppear {
            focusField = .name
        }
        .configBackButton(willDismiss: {
            viewModel.isPresentedTerms = false
        }, dismiss: dismiss)
        .adaptiveSheet(isPresented: $viewModel.isPresentedTerms, detents: [.medium(), .large()]) {
            TermsView {
                viewModel.isPresentedTerms = false
                viewModel.isNavigateToVerify.toggle()
            }
        }
        .navigate(
            to: signupVerifyComponent.makeView(),
            when: $viewModel.isNavigateToVerify
        )
    }
}
