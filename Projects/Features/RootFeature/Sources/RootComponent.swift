import NeedleFoundation
import SwiftUI
import IntroFeature

public protocol RootDependency: Dependency {
    var introComponent: IntroComponent { get }
}

public final class RootComponent: Component<RootDependency> {
    public func makeView() -> some View {
        RootView(
            introComponent: dependency.introComponent,
            viewModel: .init()
        )
    }
}
