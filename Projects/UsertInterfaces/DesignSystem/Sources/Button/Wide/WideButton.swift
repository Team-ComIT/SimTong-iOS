import SwiftUI

public struct WideButton: View {
    var text: String
    var style: Style
    var action: () -> Void

    public init(
        text: String = "",
        style: Style = .default,
        action: @escaping () -> Void = {}
    ) {
        self.text = text
        self.style = style
        self.action = action
    }

    public var body: some View {
        Button(action: action) {
            HStack {
                Spacer()

                Text(text)
                    .padding(.top, 19)
                    .padding(.bottom, 15)

                Spacer()
            }
        }
        .buttonStyle(WideButtonStyle(style: style))
    }
}

public struct WideButton_Previews: PreviewProvider {
    public static var previews: some View {
        VStack(spacing: 30) {
            Spacer()
            WideButton(text: "Enabled") {}
            WideButton(text: "Disabled") {}
                .disabled(true)

            TextField("For Testing", text: .constant(""))
            Spacer()
            WideButton(text: "Toolbar") {}
        }
    }
}
