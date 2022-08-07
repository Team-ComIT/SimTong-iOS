import SwiftUI

public struct CTAButton: View {
    var text: String
    var style: Style = .enabled
    var action: () -> Void
    
    public init(
        text: String = "",
        style: Style = .enabled,
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
        .frame(height: 48)
    }
}

public struct CTAButton_Previews: PreviewProvider {
    public static var previews: some View {
        VStack(spacing: 30) {
            CTAButton(text: "disabled", style: .disabled) {}
            CTAButton(text: "enabled", style: .enabled) {}
            CTAButton(text: "cancel", style: .cancel) {}
        }
        .padding(.horizontal)
    }
}
