import SwiftUI

public extension CTAButton {
    enum Style {
        case `default`, cancel
    }
}

struct CTAButtonStyle: ButtonStyle {
    var style: CTAButton.Style

    func makeBody(configuration: Configuration) -> some View {
        switch style {
        case .`default`:
            return AnyView(DefaultButton(configuration: configuration))
        case .cancel:
            return AnyView(CancelButton(configuration: configuration))
        }
    }

}

extension CTAButtonStyle {
    struct DefaultButton: View {
        let configuration: ButtonStyle.Configuration
        @Environment(\.isEnabled) private var isEnabled: Bool

        var stForegroundColor: Color {
            if isEnabled {
                return configuration.isPressed ?
                    Color.main06 :
                    .main
            } else {
                return .main02
            }
        }

        var body: some View {
            configuration.label
                .stTypo(.m5, color: .extraWhite)
                .background(stForegroundColor)
                .if(isEnabled) {
                    $0.shadow(
                        color: .extraBlack.opacity(configuration.isPressed ? 0 : 0.06),
                        radius: configuration.isPressed ? 0 : 4,
                        x: 0,
                        y: configuration.isPressed ? 0 : 4
                    )
                }
                .cornerRadius(5)
        }
    }

    struct CancelButton: View {
        let configuration: ButtonStyle.Configuration
        var body: some View {
            configuration.label
                .stTypo(.m5, color: .gray05)
                .background(
                    configuration.isPressed ?
                    Color.gray02 :
                    Color.gray01
                )
                .shadow(
                    color: .extraBlack.opacity(configuration.isPressed ? 0 : 0.02),
                    radius: configuration.isPressed ? 0 : 4,
                    x: 0,
                    y: configuration.isPressed ? 0 : 4
                )
                .cornerRadius(5)
        }
    }
}
