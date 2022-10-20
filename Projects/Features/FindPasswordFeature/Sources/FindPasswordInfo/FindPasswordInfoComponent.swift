import NeedleFoundation
import SwiftUI
import DomainModule

public protocol FindPasswordInfoDependency: Dependency {
    var checkExistNameAndEmailUseCase: any CheckExistNameAndEmailUseCase { get }
    var findPasswordVerifyComponent: FindPasswordVerifyComponent { get }
}

public final class FindPasswordInfoComponent: Component<FindPasswordInfoDependency> {
    public func makeView() -> some View {
        FindPasswordInfoView(
            viewModel: .init(
                checkExistNameAndEmailUseCase: dependency.checkExistNameAndEmailUseCase
            ),
            findPasswordVerifyComponent: dependency.findPasswordVerifyComponent
        )
    }
}
