import SwiftUI
import UIKit

public struct CustomTextField: View {
    @State var placeHolderText: String
    var style: Style
    var states: state
    var buttonText: String?
    var errorText: String?
    var error: Bool?
    var action: () -> Void
    @State private var text: String = ""

    public var body: some View {
        VStack {
            HStack {
                TextField("", text: $text) {}
                .modifier(TextFieldClearButton(text: $text))
                .multilineTextAlignment(.leading)
                .textFieldStyle(CustomTextFieldStyle(
                    text: $text,
                    placeholderText: $placeHolderText,
                    style: style,
                    state: states
                )
                )
                if style == .button {
                    Button(action: {}) {
                        Text(buttonText ?? "")
                            .stTypo(.m5, color: .white)
                    }
                    .frame(width: 72, height: 54)
                    .background(states == .disabled ? Color.gray04 : Color.main05)
                }
            }
            .background(states == .disabled ? Color.gray02
                        : Color.gray01)
            .overlay(
                RoundedRectangle(cornerRadius: 5)
                    .stroke(Color.main06, lineWidth: error ?? false ? 2 : 0)
            )
            .cornerRadius(5)
            .padding(.horizontal)
            if error == true {
                HStack {
                    Text(errorText ?? "")
                        .padding(.leading, 24)
                        .stTypo(.r7, color: Color.main06)
                    Spacer()
                }
            }
        }
    }
}

struct TextFieldClearButton: ViewModifier {
    @Binding var text: String

    func body(content: Content) -> some View {
        HStack {
            content

            if !text.isEmpty {
                Button(
                    action: { self.text = "" },
                    label: {
                        Image(systemName: "xmark.circle.fill")
                            .foregroundColor(Color(UIColor.opaqueSeparator))
                    }
                )
            }
        }
    }
}

public struct PlaceholderStyle: ViewModifier {
    var showPlaceHolder: Bool
    var placeholder: String
    var foregroundColor: Color

    public func body(content: Content) -> some View {
        ZStack(alignment: .leading) {
            if showPlaceHolder {
                Text(placeholder)
                    .stTypo(.r5, color: foregroundColor)
                    .padding()
            }
            content
                .padding()
        }
    }
}

public struct TextField_Previews: PreviewProvider {
    public static var previews: some View {
        VStack(spacing: 30) {
            Spacer()
            CustomTextField(placeHolderText: "Input Text", style: .default, states: .disabled, buttonText: "text") {}
            CustomTextField(placeHolderText: "Input Text", style: .default, states: .enabled, buttonText: "text") {}
            CustomTextField(placeHolderText: "Input Text", style: .button, states: .disabled, buttonText: "text") {}
            CustomTextField(placeHolderText: "Input Text", style: .button, states: .enabled, buttonText: "text") {}
            CustomTextField(
                placeHolderText: "Input Text",
                style: .button,
                states: .enabled,
                buttonText: "text",
                errorText: "errorText",
                error: true
            ) {}
            Spacer()
        }
        .background(Color.gray03)
    }
}
