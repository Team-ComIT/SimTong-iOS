import NeedleFoundation
import SwiftUI
import DomainModule

public protocol FindPasswordInfoDependency: Dependency {
    var checkExistEmployeeIDAndEmailUseCase: any CheckExistEmployeeIDAndEmailUseCase { get }
    var findPasswordVerifyComponent: FindPasswordVerifyComponent { get }
}

public final class FindPasswordInfoComponent: Component<FindPasswordInfoDependency> {
    public func makeView() -> some View {
        FindPasswordInfoView(
            viewModel: .init(
                checkExistEmployeeIDAndEmailUseCase: dependency.checkExistEmployeeIDAndEmailUseCase
            ),
            findPasswordVerifyComponent: dependency.findPasswordVerifyComponent
        )
    }
}
