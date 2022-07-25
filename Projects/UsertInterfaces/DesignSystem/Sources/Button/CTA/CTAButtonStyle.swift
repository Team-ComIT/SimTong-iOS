import SwiftUI

extension CTAButton {
    enum Style {
        case disabled, enabled, cancel
    }
}

struct CTAButtonStyle: ButtonStyle {
    var style: CTAButton.Style

    func makeBody(configuration: Configuration) -> some View {
        switch style {
        case .disabled:
            return AnyView(DisabledButton(configuration: configuration))
        case .enabled:
            return AnyView(EnabledButton(configuration: configuration))
        case .cancel:
            return AnyView(CancelButton(configuration: configuration))
        }
    }

}

extension CTAButtonStyle {
    struct DisabledButton: View {
        let configuration: ButtonStyle.Configuration
        var body: some View {
            configuration.label
                .stTypo(.m5, color: .extraWhite)
                .background(Color.gray03)
                .cornerRadius(5)
        }
    }

    struct EnabledButton: View {
        let configuration: ButtonStyle.Configuration
        var body: some View {
            configuration.label
                .stTypo(.m5, color: .extraWhite)
                .background(
                    configuration.isPressed ?
                    Color.main06 :
                    Color.main05
                )
                .shadow(
                    color: .extraBlack.opacity(configuration.isPressed ? 0 : 0.06),
                    radius: configuration.isPressed ? 0 : 4,
                    x: 0,
                    y: configuration.isPressed ? 0 : 4
                )
                .cornerRadius(5)
        }
    }

    struct CancelButton: View {
        let configuration: ButtonStyle.Configuration
        var body: some View {
            configuration.label
                .stTypo(.m5, color: .gray04)
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
