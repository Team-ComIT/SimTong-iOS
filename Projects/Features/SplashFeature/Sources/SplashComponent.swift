import DomainModule
import SwiftUI
import NeedleFoundation

public protocol SplashDependency: Dependency {
    var reissueTokenUseCase: any ReissueTokenUseCase { get }
}

public final class SplashComponent: Component<SplashDependency> {
    public func makeView() -> some View {
        SplashView(
            viewModel: .init(
                reissueTokenUseCase: self.dependency.reissueTokenUseCase
            )
        )
    }
}
