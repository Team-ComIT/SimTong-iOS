import SwiftUI

public struct STSecureTextField: View {
    var placeHolderText: String
    var labelText: String
    @Binding var text: String
    var style: STTextField.Style
    var buttonText: String
    var errorText: String
    var isError: Bool
    var buttonAction: () -> Void
    var onCommit: () -> Void
    @State var isSecure = true

    public init(
        _ placeholderText: String = "",
        labelText: String = "",
        text: Binding<String>,
        style: STTextField.Style = .default,
        buttonText: String = "",
        errorText: String = "",
        isError: Bool = false,
        buttonAction: @escaping () -> Void = {},
        onCommit: @escaping () -> Void = {}
    ) {
        self.placeHolderText = placeholderText
        self.labelText = labelText
        self._text = text
        self.style = style
        self.buttonText = buttonText
        self.errorText = errorText
        self.isError = isError
        self.buttonAction = buttonAction
        self.onCommit = onCommit
    }

    public var body: some View {
        VStack(alignment: .leading) {
            HStack {
                Text(labelText)
                    .stTypo(.r5, color: .gray06)
                Spacer()
            }
            .padding(.bottom, 8)
            if isSecure {
                SecureField("", text: $text)
                    .textFieldStyle(
                        STTextFieldStyle(
                            text: $text,
                            buttonText: buttonText,
                            placeholderText: placeHolderText,
                            style: style,
                            buttonAction: buttonAction
                        )
                    )
                    .modifier(STTextFieldSecureModifier(isSecure: $isSecure))
                    .overlay(
                        RoundedRectangle(cornerRadius: 5)
                            .stroke(Color.main06, lineWidth: isError ? 2 : 0)
                    )
                    .cornerRadius(5)
                    .onSubmit(onCommit)
            } else {
                TextField("", text: $text)
                    .textFieldStyle(
                        STTextFieldStyle(
                            text: $text,
                            buttonText: buttonText,
                            placeholderText: placeHolderText,
                            style: style,
                            buttonAction: buttonAction
                        )
                    )
                    .modifier(STTextFieldSecureModifier(isSecure: $isSecure))
                    .overlay(
                        RoundedRectangle(cornerRadius: 5)
                            .stroke(Color.main06, lineWidth: isError ? 2 : 0)
                    )
                    .cornerRadius(5)
                    .onSubmit(onCommit)
            }
            if isError == true {
                Text(errorText)
                    .padding(.leading, 24)
                    .stTypo(.r7, color: Color.main06)
            }
        }
    }
}

struct STTextFieldSecureModifier: ViewModifier {
    @Binding var isSecure: Bool

    func body(content: Content) -> some View {
        ZStack {
            content
            HStack {
                Spacer()
                Button {
                    isSecure.toggle()
                } label: {
                    Image(systemName: isSecure ? "eye.fill" : "eye.slash.fill")
                        .foregroundColor(Color.gray04)
                }
                .padding()
            }
        }
    }
}

public struct SecureTextField_Previews: PreviewProvider {
    public static var previews: some View {
        Group {
            ScrollView {
                VStack(spacing: 30) {
                    Spacer()
                    STSecureTextField(
                        "Input Text",
                        text: .constant(""),
                        style: .default,
                        buttonText: "text",
                        errorText: "errorText",
                        isError: false
                    )
                    STSecureTextField(
                        "Input Text",
                        text: .constant(""),
                        style: .default,
                        buttonText: "text",
                        errorText: "errorText",
                        isError: true
                    )
                    STSecureTextField(
                        "Input Text",
                        text: .constant(""),
                        style: .button,
                        buttonText: "text",
                        errorText: "errorText",
                        isError: false
                    )
                    STSecureTextField(
                        "Input Text",
                        text: .constant(""),
                        style: .button,
                        buttonText: "text",
                        errorText: "errorText",
                        isError: false
                    )
                    STSecureTextField(
                        "Input Text",
                        text: .constant("1"),
                        style: .default,
                        buttonText: "text",
                        errorText: "errorText",
                        isError: false
                    )
                    STSecureTextField(
                        "Input Text",
                        text: .constant("1"),
                        style: .default,
                        buttonText: "text",
                        errorText: "errorText",
                        isError: true
                    )
                    STSecureTextField(
                        "Input Text",
                        text: .constant("1"),
                        style: .button,
                        buttonText: "text",
                        errorText: "errorText",
                        isError: false
                    )
                    STSecureTextField(
                        "Input Text",
                        text: .constant("1"),
                        style: .button,
                        buttonText: "text",
                        errorText: "errorText",
                        isError: true
                    )
                    Spacer()
                }
            }
            .background(Color.gray03)
            .previewInterfaceOrientation(.portrait)
        }
    }
}
