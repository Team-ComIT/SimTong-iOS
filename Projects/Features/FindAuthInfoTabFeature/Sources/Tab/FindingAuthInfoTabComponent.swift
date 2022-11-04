import NeedleFoundation
import SwiftUI
import FindEmployeeIDFeature
import FindPasswordFeature

public protocol FindAuthInfoTabDependency: Dependency {
    var findEmployeeIDComponent: FindEmployeeIDComponent { get }
    var findPasswordInfoComponent: FindPasswordInfoComponent { get }
}
public final class FindAuthInfoTabComponent: Component<FindAuthInfoTabDependency> {
    public func makeView() -> some View {
        FindAuthInfoTabView(
            findEmployeeIDComponent: dependency.findEmployeeIDComponent,
            findPasswordComponent: dependency.findPasswordInfoComponent
        )
    }
}
