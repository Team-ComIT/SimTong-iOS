import NeedleFoundation
import SwiftUI
import RootFeature

final class AppComponent: BootstrapComponent {
    func makeRootView() -> some View {
        rootComponent.makeView()
    }

    var rootComponent: RootComponent {
        RootComponent(parent: self)
    }
}

// MARK: - Auth
extension AppComponent {}
