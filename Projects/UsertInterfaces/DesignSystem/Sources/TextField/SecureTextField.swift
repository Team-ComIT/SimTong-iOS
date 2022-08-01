import SwiftUI

public struct STSecureTextField: View {
    var placeHolderText: String
    var style: STTextField.Style
    @State var buttonText: String?
    var errorText: String?
    var isError: Bool?
    var buttonAction: (() -> Void)?
    var onCommit: (() -> Void)?
    @Binding var text: String

    public var body: some View {
        VStack(alignment: .leading) {
            SecureField("", text: $text)
            .textFieldStyle(
                STTextFieldStyle(
                    text: $text,
                    buttonText: $buttonText,
                    placeholderText: placeHolderText,
                    style: style
                )
            )
            .overlay(
                RoundedRectangle(cornerRadius: 5)
                    .stroke(Color.main06, lineWidth: isError ?? false ? 2 : 0)
            )
            .cornerRadius(5)
            if isError == true {
                Text(errorText ?? "")
                    .padding(.leading, 24)
                    .stTypo(.r7, color: Color.main06)
            }
        }
    }
}

public struct SecureTextField_Previews: PreviewProvider {
    public static var previews: some View {
        Group {
            VStack(spacing: 30) {
                Spacer()
                STTextField(
                    placeHolderText: "Input Text",
                    style: .default,
                    buttonText: "text",
                    errorText: "errorText",
                    isError: false,
                    text: .constant("")
                )
                STTextField(
                    placeHolderText: "Input Text",
                    style: .default,
                    buttonText: "text",
                    errorText: "errorText",
                    isError: true,
                    text: .constant("")
                )
                STTextField(
                    placeHolderText: "Input Text",
                    style: .button,
                    buttonText: "text",
                    errorText: "errorText",
                    isError: false,
                    text: .constant("")
                )
                STTextField(
                    placeHolderText: "Input Text",
                    style: .button,
                    buttonText: "text",
                    errorText: "errorText",
                    isError: false,
                    text: .constant("")
                )
                STTextField(
                    placeHolderText: "Input Text",
                    style: .button,
                        buttonText: "text",
                    errorText: "errorText",
                    isError: true,
                    text: .constant("")
                )
                Spacer()
            }
            .background(Color.gray03)
        }
    }
}
