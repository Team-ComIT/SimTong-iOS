import SwiftUI

public extension WideButton {
    enum Style {
        case disabled, enabled
    }
}

struct WideButtonStyle: ButtonStyle {
    var style: WideButton.Style

    func makeBody(configuration: Configuration) -> some View {
        switch style {
        case .disabled:
            return AnyView(DisabledButton(configuration: configuration))
        case .enabled:
            return AnyView(EnabledButton(configuration: configuration))
        }
    }
}

extension WideButtonStyle {
    struct DisabledButton: View {
        let configuration: ButtonStyle.Configuration
        var body: some View {
            configuration.label
                .stTypo(.m5, color: .extraWhite)
                .background(Color.main02)
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
        }
    }
}
