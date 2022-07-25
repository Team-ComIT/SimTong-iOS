import SwiftUI

public struct WideButton: View {
    var text: String?
    var style: Style = .enabled
    var action: () -> Void

    public var body: some View {
        Button(action: action) {
            HStack {
                Spacer()
                Text(text ?? "")
                    .padding(.top, 19)
                    .padding(.bottom, 15)
                Spacer()
            }
        }
        .buttonStyle(WideButtonStyle(style: style))
        .frame(height: 48)
    }
}

public struct WideButton_Previews: PreviewProvider {
    public static var previews: some View {
        VStack(spacing: 30) {
            Spacer()
            WideButton(text: "Disabled", style: .disabled) {}
            WideButton(text: "Enabled") {}

            TextField("For Testing", text: .constant(""))
            Spacer()
            WideButton(text: "Toolbar") {}
        }
    }
}
