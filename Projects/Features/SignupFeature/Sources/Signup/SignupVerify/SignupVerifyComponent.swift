import NeedleFoundation
import SwiftUI

public protocol SignupVerifyDependency: Dependency {}

public final class SignupVerifyComponent: Component<SignupVerifyDependency> {
    public func makeView() -> some View {
        SignupVerifyView()
    }
}
