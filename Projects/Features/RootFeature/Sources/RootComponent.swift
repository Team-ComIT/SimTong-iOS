import NeedleFoundation
import SwiftUI
import IntroFeature
import MainTabFeature

public protocol RootDependency: Dependency {
    var introComponent: IntroComponent { get }
    var mainTabComponent: MainTabComponent { get }
}

public final class RootComponent: Component<RootDependency> {
    public func makeView() -> some View {
        RootView(
            introComponent: dependency.introComponent,
            mainTabComponent: dependency.mainTabComponent,
            viewModel: .init()
        )
    }
}
