import SwiftUI

public struct STTextField: View {
    var placeHolderText: String
    var style: Style
    @State var buttonText: String?
    var errorText: String?
    var isError: Bool?
    var buttonAction: (() -> Void)? = {}
    var onCommit: () -> Void = {}
    @Binding var text: String

    public var body: some View {
        VStack(alignment: .leading) {
            TextField("", text: $text)
                .textFieldStyle(
                    STTextFieldStyle(
                        text: $text,
                        buttonText: $buttonText,
                        placeholderText: placeHolderText,
                        style: style,
                        buttonAction: buttonAction
                    )
                )
                .overlay(
                    RoundedRectangle(cornerRadius: 5)
                        .stroke(Color.main06, lineWidth: isError ?? false ? 2 : 0)
                )
                .cornerRadius(5)
                .onSubmit {
                    onCommit()
                }
            if isError == true {
                Text(errorText ?? "")
                    .padding(.leading, 24)
                    .stTypo(.r7, color: Color.main06)
            }
        }
    }
}

struct STTextFieldClearButton: ViewModifier {
    @Binding var text: String

    func body(content: Content) -> some View {
        HStack {
            content

            if !text.isEmpty {
                Button(
                    action: { self.text = "" },
                    label: {
                        Image(systemName: "xmark.circle.fill")
                            .foregroundColor(Color.gray04)
                    }
                )
                .padding()
            }
        }
    }
}

public struct PlaceholderStyle: ViewModifier {
    var showPlaceHolder: Bool
    var placeholder: String

    public func body(content: Content) -> some View {
        ZStack(alignment: .leading) {
            if showPlaceHolder {
                Text(placeholder)
                    .stTypo(.r5, color: Color.gray04)
                    .padding()
            }
            content
                .padding()
        }
    }
}

public struct TextField_Previews: PreviewProvider {
    public static var previews: some View {
        Group {
            ScrollView {
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
                        style: .default,
                        buttonText: "text",
                        errorText: "errorText",
                        isError: false,
                        text: .constant("1")
                    )
                    STTextField(
                        placeHolderText: "Input Text",
                        style: .default,
                        buttonText: "text",
                        errorText: "errorText",
                        isError: true,
                        text: .constant("1")
                    )
                    STTextField(
                        placeHolderText: "Input Text",
                        style: .button,
                        buttonText: "text",
                        errorText: "errorText",
                        isError: false,
                        text: .constant("1")
                    )
                    STTextField(
                        placeHolderText: "Input Text",
                        style: .button,
                        buttonText: "text",
                        errorText: "errorText",
                        isError: true,
                        text: .constant("1")
                    )
                    Spacer()
                }
                .background(Color.gray03)
                .previewInterfaceOrientation(.portrait)
            }
        }
    }
}
