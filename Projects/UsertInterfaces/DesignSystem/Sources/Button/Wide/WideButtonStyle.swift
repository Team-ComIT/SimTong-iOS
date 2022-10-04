import SwiftUI

public extension WideButton {
    enum Style {
        case `default`
    }
}

struct WideButtonStyle: ButtonStyle {
    var style: WideButton.Style

    func makeBody(configuration: Configuration) -> some View {
        switch style {
        case .`default`:
            return AnyView(DefaultButton(configuration: configuration))
        }
    }
}

extension WideButtonStyle {
    struct DefaultButton: View {
        let configuration: ButtonStyle.Configuration
        @Environment(\.isEnabled) var isEnabled: Bool

        var stForegroundColor: Color {
            if isEnabled {
                return configuration.isPressed ?
                    Color.main06 :
                    .main05
            } else {
                return .main02
            }
        }

        var body: some View {
            configuration.label
                .stTypo(.m5, color: .extraWhite)
                .background(stForegroundColor)
        }
    }
}
