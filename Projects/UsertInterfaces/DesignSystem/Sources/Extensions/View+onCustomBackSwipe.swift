import SwiftUI

public extension View {
    func onBackSwipe(offset: Binding<CGSize>, perform action: @escaping () -> Void) -> some View {
        self.gesture(
            DragGesture()
                .onChanged { value in
                    if value.startLocation.x < 50 {
                        withAnimation(.spring()) {
                            offset.wrappedValue = value.translation
                        }
                    }
                }
                .onEnded({ value in
                    if value.startLocation.x < 50 && value.translation.width > 120 {
                        withAnimation(.spring()) {
                            action()
                        }
                    } else {
                        withAnimation(.spring()) {
                            offset.wrappedValue = .init(width: 0, height: 0)
                        }
                    }
                })
        )
    }
}
