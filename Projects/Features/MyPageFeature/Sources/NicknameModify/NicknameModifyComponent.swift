import DomainModule
import NeedleFoundation
import SwiftUI

public protocol NicknameModifyDependency: Dependency { }

public final class NicknameModifyComponent: Component<NicknameModifyDependency> {
    public func makeView() -> some View {
        NicknameModifyView(viewModel: .init())
    }
}
