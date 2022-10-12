import NeedleFoundation
import SwiftUI

public protocol SignupEmployeeInfoDependency: Dependency {}

public final class SignupEmployeeInfoComponent: Component<SignupEmployeeInfoDependency> {
    public func makeView() -> some View {
        SignupEmployeeInfoView(viewModel: .init())
    }
}
