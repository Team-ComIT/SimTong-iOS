import SwiftUI

struct STTextFieldPreview: View {
    @State var defaultText = ""
    @State var secureText = ""
    @State var buttonText = ""
    @State var buttonIsError = false
    var body: some View {
        ZStack {
            Color.extraBackground
                .edgesIgnoringSafeArea(.all)
            VStack(spacing: 30) {
                STTextField("placeholder", text: $defaultText)
                STSecureTextField("placeholder", text: $secureText)
                STTextField(
                    "placeholder",
                    text: $buttonText,
                    style: .button,
                    buttonText: "Text",
                    errorText: "Error has appeared",
                    isError: buttonIsError,
                    buttonAction: {
                        buttonIsError.toggle()
                    }, onCommit: {
                        buttonIsError.toggle()
                    }
                )
            }
            .padding(.horizontal)
        }
    }
}

struct STTextFieldPreview_Previews: PreviewProvider {
    static var previews: some View {
        STTextFieldPreview()
    }
}
