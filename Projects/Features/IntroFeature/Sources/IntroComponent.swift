import NeedleFoundation
import SwiftUI

public protocol IntroDependency: Dependency {}

public final class IntroComponent: Component<IntroDependency> {
    public func makeView() -> some View {
        Text("")
    }
}
