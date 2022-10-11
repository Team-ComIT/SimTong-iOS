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

    enum SimTongEnum: Hashable {
        case name
        case number
        case email
    }

    @StateObject var viewModel: SignupViewModel
    @FocusState private var focusField: FocusField?
    
    @State var simTong: SimTongEnum = .email

    @State var isEnabled: Bool = false
    @State var isNumberTextField: Bool = false
    @State var isEmailTextField: Bool = false
    @State var wideButtonText: String = "다음"

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
                            if isEmailTextField {
                                STTextField(labelText: "이메일", text: $viewModel.emailText)
                                    .focused($focusField, equals: .email)
                                    .opacity(isNumberTextField ? 1.0 : 0.0)
                                    .onChange(of: viewModel.emailText) { _ in
                                        isEnabled = true
                                    }
                            }
                            if isNumberTextField {
                                STTextField("와!", labelText: "사원번호", text: $viewModel.numberText, style: .clear, onCommit: {
                                    focusField = .email
                                })
                                    .focused($focusField, equals: .number)
                                    .opacity(isNumberTextField ? 1.0 : 0.0)
                                    .keyboardType(.numberPad)
                                    .onChange(of: viewModel.numberText) { _ in
                                        isEnabled = true
                                    }
                            }
                            STTextField(labelText: "이름", text: $viewModel.nameText, style: .clear)
                                .focused($focusField, equals: .name)
                                .onChange(of: viewModel.nameText) { _ in
                                    isEnabled = true
                                }
                        }
                        .padding(.horizontal, 16)
                        .padding(.vertical, 10)
                        HStack {
                            Text("계정이 있으신가요?")
                                .stTypo(.r7)
                                .foregroundColor(.gray05)
                            NavigationLink(destination: PasswordView()) {
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
            .background(Color.extraBackground)
            VStack {
                Spacer()
                WideButton(text: wideButtonText) {
                    withAnimation(Animation.spring().speed(0.7)) {
                        isEnabled = false
                        if isNumberTextField {
                            isEmailTextField = true
                        }
                        wideButtonText = wideButtonText == "다음" ? "확인" : "인증"
                        isNumberTextField = true
                    }
                }
                .disabled(!isEnabled)
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
