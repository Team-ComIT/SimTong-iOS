import SwiftUI
import DesignSystem

@main
struct SimTongApp: App {
    var body: some Scene {
        WindowGroup {
            NavigationView {
                Text("Hello World")
                    .onAppear {
                        print(safeArea().top)
                }
            }
        }
    }
    func safeArea() -> UIEdgeInsets {
        guard let screen = UIApplication.shared.connectedScenes.first as? UIWindowScene else {
            return .zero
        }
        guard let safeArea = screen.windows.first?.safeAreaInsets else {
            return .zero
        }
        return safeArea
    }
}
