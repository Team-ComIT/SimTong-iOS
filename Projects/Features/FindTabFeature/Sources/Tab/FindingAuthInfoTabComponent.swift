import NeedleFoundation
import SwiftUI
import FindEmployeeIDFeature

public protocol FindAuthInfoTabDependency: Dependency {
    var findEmployeeIDComponent: FindEmployeeIDComponent { get }
}
public final class FindAuthInfoTabComponent: Component<FindAuthInfoTabDependency> {
    public func makeView() -> some View {
        FindAuthInfoTabView(findEmployeeIDComponent: dependency.findEmployeeIDComponent)
    }
}
