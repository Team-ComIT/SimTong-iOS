import NeedleFoundation
import SwiftUI

public protocol EmployeeIDResultDependency: Dependency {}

public final class EmployeeIDResultComponent: Component<EmployeeIDResultDependency> {
    public func makeView(username: String, resultID: String) -> some View {
        EmployeeIDResultView(username: username, resultID: resultID)
    }
}
