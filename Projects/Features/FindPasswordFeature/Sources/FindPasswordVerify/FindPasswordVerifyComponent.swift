import NeedleFoundation
import SwiftUI

public protocol FindPasswordVerifyDependency: Dependency {}

public final class FindPasswordVerifyComponent: Component<FindPasswordVerifyDependency> {
    public func makeView() -> some View {
        FindPasswordVerifyVIew(
            viewModel: .init()
        )
    }
}
