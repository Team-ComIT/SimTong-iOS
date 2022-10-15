import SwiftUI

public struct STSnackbar: ViewModifier {
    @Binding var isShowing: Bool
    var text: String

    public init(
        isShowing: Binding<Bool>,
        text: String
    ) {
        _isShowing = isShowing
        self.text = text
    }

    public func body(content: Content) -> some View {
        ZStack {
            content

            snackbarView()
        }
    }

    @ViewBuilder
    func snackbarView() -> some View {
        VStack {
            Spacer()

            if isShowing {
                HStack {
                    Spacer()

                    HStack(spacing: 16) {
                        Image(systemName: "exclamationmark.circle")
                            .resizable()
                            .frame(width: 18, height: 18)
                            .foregroundColor(.extraWhite)

                        Text(text)
                            .stTypo(.r6, color: .extraWhite)

                        Spacer()
                    }
                    .padding(15)

                    Spacer()
                }
                .background {
                    Color.grayMain
                        .opacity(0.6)
                }
                .cornerRadius(5)
                .padding(.bottom, 16)
                .padding(.horizontal, 16)
                .transition(.opacity.animation(.easeOut(duration: 0.3)))
                .onAppear {
                    DispatchQueue.main.asyncAfter(deadline: .now() + 4) {
                        withAnimation {
                            isShowing = false
                        }
                    }
                }
            }
        }
    }
}

public extension View {
    func stSnackbar(
        isShowing: Binding<Bool>,
        text: String
    ) -> some View {
        modifier(STSnackbar(isShowing: isShowing, text: text))
    }
}
