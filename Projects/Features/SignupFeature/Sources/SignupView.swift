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
                            STTextField(labelText: "이메일", text: $viewModel.email, style: .clear, onCommit: {
                                viewModel.nextButtonDidTap()
                            })
                            .focused($focusField, equals: .email)
                            .opacity(viewModel.isEmailStep ? 1.0 : 0.0)
                        }

                        if viewModel.isNumberStep {
                            STTextField("와!", labelText: "사원번호", text: $viewModel.number, style: .clear, onCommit: {
                                withAnimation {
                                    viewModel.nextButtonDidTap()
                                    focusField = .email
                                }
                            })
                            .focused($focusField, equals: .number)
                            .opacity(viewModel.isNumberStep ? 1.0 : 0.0)
                            .keyboardType(.numberPad)
                        }

                        STTextField(labelText: "이름", text: $viewModel.name, style: .clear, onCommit: {
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
    }
}

struct PasswordView: View {
    var body: some View {
        HStack {
        }
    }
}
