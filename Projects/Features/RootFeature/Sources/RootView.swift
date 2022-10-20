import BaseFeature
import IntroFeature
import SwiftUI
import MainTabFeature

public struct RootView: View {
    @AppStorage("SCENE_FLOW") var sceneFlow: SceneFlow = .splash
    @StateObject var viewModel: RootViewModel
    private let introComponent: IntroComponent
    private let mainTabComponent: MainTabComponent

    init(
        introComponent: IntroComponent,
        mainTabComponent: MainTabComponent,
        viewModel: RootViewModel
    ) {
        self.introComponent = introComponent
        self.mainTabComponent = mainTabComponent
        _viewModel = StateObject(wrappedValue: viewModel)
    }

    public var body: some View {
        ZStack {
            switch sceneFlow {
            case .splash:
                Text("SPLASH")

            case .main:
                mainTabComponent.makeView()

            case .signin:
                introComponent.makeView()
            }
        }
    }
}
