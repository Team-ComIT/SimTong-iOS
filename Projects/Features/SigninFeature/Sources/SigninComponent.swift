import NeedleFoundation
import SwiftUI
import FindTabFeature

public protocol SigninDependency: Dependency {
    var findAuthInfoTabComponent: FindAuthInfoTabComponent { get }
}

public final class SigninComponent: Component<SigninDependency> {
    public func makeView() -> some View {
        SigninView(
            viewModel: .init(),
            findAuthInfoTabComponent: dependency.findAuthInfoTabComponent
        )
    }
}
