import SwiftUI

struct BackgroundModifier: ViewModifier {
    func body(content: Content) -> some View {
        ZStack {
            Color.extraBackground
                .ignoresSafeArea()

            content
        }
    }
}

public extension View {
    func stBackground() -> some View {
        modifier(BackgroundModifier())
    }
}
