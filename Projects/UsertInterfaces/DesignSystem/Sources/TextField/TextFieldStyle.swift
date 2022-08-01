// swiftlint:disable all
import SwiftUI
import UIKit

extension STTextField {
    enum Style {
        case `default`, button
    }
}

struct STTextFieldStyle: TextFieldStyle {
    @Binding var text: String
    @Binding var buttonText: String?
    var placeholderText: String
    var style: STTextField.Style

    func _body(configuration: TextField<Self._Label>) -> some View {
        switch style {
        case .`default`:
            return AnyView(DefaultSTTextField(configuration: configuration, text: $text, placeholderText: placeholderText))
        case .button:
            return AnyView(ButtonSTTextField(configuration: configuration, text: $text, buttonText: $buttonText, placeholderText: placeholderText))
        }
    }
}

extension STTextFieldStyle {
    struct DefaultSTTextField: View {
        let configuration: TextField<STTextFieldStyle._Label>
        @Binding var text: String
        var placeholderText: String
        @FocusState private var focusState: Bool
        
        var body: some View {
            HStack {
                configuration
                    .modifier(PlaceholderStyle(showPlaceHolder: text.isEmpty, placeholder: placeholderText))
                    .modifier(STTextFieldClearButton(text: $text))
                    .multilineTextAlignment(.leading)
            }
            .focused($focusState)
            .background(focusState || !text.isEmpty ? Color.gray01 : Color.gray02)
        }
    }
    struct ButtonSTTextField: View {
        let configuration: TextField<STTextFieldStyle._Label>
        @Binding var text: String
        @Binding var buttonText: String?
        var placeholderText: String
        @FocusState private var focusState: Bool
        
        var body: some View {
            HStack {
                configuration
                    .modifier(PlaceholderStyle(showPlaceHolder: text.isEmpty, placeholder: placeholderText))
                    .multilineTextAlignment(.leading)
                Button {
                } label: {
                    Text(buttonText ?? "")
                        .stTypo(.m5, color: .extraWhite)
                }
                .frame(width: 72, height: 54)
                .background(!text.isEmpty ? Color.main05 : Color.gray04)
            }
            .focused($focusState)
            .background(focusState || !text.isEmpty ? Color.gray01 : Color.gray02)
        }
    }
}