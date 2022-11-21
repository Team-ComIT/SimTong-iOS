import NeedleFoundation
import SwiftUI
import MyPageFeature

public protocol HomeDependency: Dependency {
    var myPageComponent: MyPageComponent { get }
}

public final class HomeComponent: Component<HomeDependency> {
    public func makeView() -> some View {
        HomeView(
            myPageComponent: self.dependency.myPageComponent,
            viewModel: .init()
        )
    }
}
