import SwiftUI

struct BottomSheet<T: View>: ViewModifier {
    @Binding var isShowing: Bool
    @State var dragHeight: CGFloat = 0
    var content: () -> T
    var sheetDragging: some Gesture {
        DragGesture(minimumDistance: 0, coordinateSpace: .global)
            .onChanged { value in
                withAnimation(.spring()) {
                    dragHeight = min(30, -value.translation.height)
                }
            }
            .onEnded { value in
                withAnimation(.spring()) {
                    dragHeight = 0
                }
                let verticalAmount = value.translation.height
                if verticalAmount > 100 {
                    withAnimation {
                        isShowing = false
                    }
                }
            }
    }

    init(
        isShowing: Binding<Bool>,
        content: @escaping () -> T
    ) {
        _isShowing = isShowing
        self.content = content
    }

    func body(content: Content) -> some View {
        ZStack {
            content

            ZStack(alignment: .bottom) {
                if isShowing {
                    Color.extraBlack
                        .opacity(0.25)
                        .ignoresSafeArea()
                        .onTapGesture {
                            withAnimation {
                                isShowing = false
                            }
                        }
                        .gesture(sheetDragging)
                        .transition(.opacity)

                    ZStack {
                        Color.extraWhite
                            .cornerRadius(24, corners: [.topLeft, .topRight])
                            .padding(.top, -dragHeight)
                            .gesture(sheetDragging)

                        VStack {
                            self.content()
                                .frame(maxWidth: .infinity)
                                .transition(.move(edge: .bottom))
                        }
                        .padding(.bottom, 42)
                        .offset(y: -dragHeight)
                    }
                    .fixedSize(horizontal: false, vertical: true)
                    .transition(.move(edge: .bottom))
                }
            }
            .frame(maxWidth: .infinity, maxHeight: .infinity, alignment: .bottom)
            .ignoresSafeArea()
        }
        .animation(.default, value: isShowing)
    }
}

public extension View {
    func bottomSheet<Content: View>(
        isShowing: Binding<Bool>,
        content: @escaping () -> Content
    ) -> some View {
        modifier(BottomSheet(isShowing: isShowing, content: content))
    }
}
