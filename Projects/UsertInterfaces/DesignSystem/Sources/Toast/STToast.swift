import SwiftUI

public struct STToast: ViewModifier {
    public enum Icon {
        case success, failed, none
    }
    @Binding var isShowing: Bool
    let message: String
    let icon: Icon

    init(
        isShowing: Binding<Bool>,
        message: String = "",
        icon: Icon = .success
    ) {
        self.message = message
        self.icon = icon
        self._isShowing = isShowing
    }

    public func body(content: Content) -> some View {
        ZStack {
            content
            toastView()
        }
    }

    @ViewBuilder
    private func toastView() -> some View {
        VStack {
            if isShowing {
                HStack(spacing: 8) {
                    if icon != .none {
                        Image(systemName: icon == .success ? "checkmark.circle.fill" : "xmark.circle.fill")
                            .resizable()
                            .renderingMode(.template)
                            .foregroundColor(icon == .success ? .extraCheck : .extraError)
                            .frame(width: 18, height: 18)
                    }
                    Text(message)
                        .stTypo(.r6, color: .extraBlack)
                }
                .padding(.horizontal, 16)
                .padding(.vertical, 16.5)
                .background(Color.extraWhite)
                .cornerRadius(8)
                .transition(.move(edge: .top))
                .onTapGesture {
                    withAnimation {
                        isShowing = false
                    }
                }
                .onAppear {
                    DispatchQueue.main.asyncAfter(deadline: .now() + 1.5) {
                        withAnimation {
                            isShowing = false
                        }
                    }
                }
            }
            Spacer()
        }
        .offset(y: safeArea().top)
        .ignoresSafeArea()
    }
    private func safeArea() -> UIEdgeInsets {
        guard let screen = UIApplication.shared.connectedScenes.first as? UIWindowScene else {
            return .zero
        }
        guard let safeArea = screen.windows.first?.safeAreaInsets else {
            return .zero
        }
        return safeArea
    }
}

public extension View {
    func stToast(
        isShowing: Binding<Bool>,
        message: String,
        icon: STToast.Icon = .success
    ) -> some View {
        self
            .modifier(STToast(isShowing: isShowing, message: message, icon: icon))
    }
}
