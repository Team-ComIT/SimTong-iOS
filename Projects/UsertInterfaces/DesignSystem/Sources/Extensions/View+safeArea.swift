import SwiftUI

public extension View {
    func statusBarHeight() -> CGFloat {
        guard let screen = UIApplication.shared.connectedScenes.first as? UIWindowScene else {
            return .zero
        }
        guard let safeArea = screen.windows.first?.windowScene?.statusBarManager?.statusBarFrame.height else {
            return .zero
        }
        return safeArea
    }
}
