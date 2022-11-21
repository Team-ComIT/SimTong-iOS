import Combine

public final class AppState: ObservableObject {
    @Published public var sceneFlow: SceneFlow

    public init(sceneFlow: SceneFlow = .splash) {
        self.sceneFlow = sceneFlow
    }
}
