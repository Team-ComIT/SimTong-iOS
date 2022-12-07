import DomainModule
import NeedleFoundation
import SwiftUI

public protocol NicknameChangeDependency: Dependency {
    var changeNicknameUseCase: any ChangeNicknameUseCase { get }
}

public final class NicknameChangeComponent: Component<NicknameChangeDependency> {
    public func makeView() -> some View {
        NicknameChangeView(viewModel: .init(changeNicknameUseCase: dependency.changeNicknameUseCase))
    }
}
