import SwiftUI
import IntroFeature
import BaseFeature

public struct RootView: View {
    @AppStorage("SCENE_FLOW") var sceneFlow: SceneFlow = .splash
    @StateObject var viewModel: RootViewModel
    private let introComponent: IntroComponent

    init(
        introComponent: IntroComponent,
        viewModel: RootViewModel
    ) {
        self.introComponent = introComponent
        _viewModel = StateObject(wrappedValue: viewModel)
    }

    public var body: some View {
        ZStack {
            switch sceneFlow {
            case .splash:
                Text("SPLASH")

            case .main:
                Text("MAIN")

            case .signin:
                introComponent.makeView()
            }
        }
    }
}
