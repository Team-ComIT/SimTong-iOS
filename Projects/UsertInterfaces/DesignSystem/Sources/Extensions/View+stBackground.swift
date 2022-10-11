import SwiftUI

struct BackgroundModifier: ViewModifier {
    func body(content: Content) -> some View {
        content
            .background {
                Color.extraBackground
                    .ignoresSafeArea()
            }
    }
}

public extension View {
    func stBackground() -> some View {
        modifier(BackgroundModifier())
    }
}
