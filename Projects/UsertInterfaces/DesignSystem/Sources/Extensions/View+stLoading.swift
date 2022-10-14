import SwiftUI

struct STLoadingModifier: ViewModifier {
    @Binding var isLoading: Bool
    func body(content: Content) -> some View {
        ZStack {
            content

            if isLoading {
                STLoadingView(play: $isLoading)
                    .padding(6)
                    .background(Color.extraWhite)
                    .frame(width: 64, height: 64)
                    .clipShape(Circle())
            }
        }
    }
}

public extension View {
    func stLoading(isLoading: Binding<Bool>) -> some View {
        modifier(STLoadingModifier(isLoading: isLoading))
    }
}
