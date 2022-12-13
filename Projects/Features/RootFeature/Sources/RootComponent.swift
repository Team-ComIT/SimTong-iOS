import NeedleFoundation
import SwiftUI
import IntroFeature
import MainTabFeature
import SplashFeature
import GuestFeature

public protocol RootDependency: Dependency {
    var introComponent: IntroComponent { get }
    var mainTabComponent: MainTabComponent { get }
    var splashComponent: SplashComponent { get }
    var guestComponent: GuestComponent { get }
}

public final class RootComponent: Component<RootDependency> {
    public func makeView() -> some View {
        RootView(
            introComponent: dependency.introComponent,
            mainTabComponent: dependency.mainTabComponent,
            splashComponent: dependency.splashComponent,
            guestComponent: dependency.guestComponent,
            viewModel: .init()
        )
    }
}
