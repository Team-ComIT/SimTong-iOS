import DomainModule
import NeedleFoundation
import SwiftUI

public protocol NicknameChangeDependency: Dependency {}

public final class NicknameChangeComponent: Component<NicknameChangeDependency> {
    public func makeView() -> some View {
        NicknameChangeView(viewModel: .init())
    }
}
