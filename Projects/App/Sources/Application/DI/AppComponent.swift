import NeedleFoundation
import SwiftUI
import RootFeature
import IntroFeature
import FindAuthInfoFeature
import SignupFeature

final class AppComponent: BootstrapComponent {
    func makeRootView() -> some View {
        rootComponent.makeView()
    }

    var rootComponent: RootComponent {
        RootComponent(parent: self)
    }
}

// MARK: - Auth
extension AppComponent {
    var introComponent: IntroComponent {
        IntroComponent(parent: self)
    }
    var signupComponent: SignupComponent {
        SignupComponent(parent: self)
    }
}
