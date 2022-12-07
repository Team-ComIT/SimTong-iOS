import SwiftUI

public struct CTAButton: View {
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
                    .padding(.vertical, 17)

                Spacer()
            }
        }
        .buttonStyle(CTAButtonStyle(style: style))
    }
}

public struct CTAButton_Previews: PreviewProvider {
    public static var previews: some View {
        VStack(spacing: 30) {
            CTAButton(text: "enabled") {}
            CTAButton(text: "disabled") {}
                .disabled(true)
            CTAButton(text: "cancel", style: .cancel) {}
        }
        .padding(.horizontal)
    }
}
