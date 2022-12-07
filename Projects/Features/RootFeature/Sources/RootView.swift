import BaseFeature
import IntroFeature
import SwiftUI
import MainTabFeature
import SplashFeature

public struct RootView: View {
    @EnvironmentObject var appState: AppState
    @StateObject var viewModel: RootViewModel
    private let introComponent: IntroComponent
    private let mainTabComponent: MainTabComponent
    private let splashComponent: SplashComponent

    init(
        introComponent: IntroComponent,
        mainTabComponent: MainTabComponent,
        splashComponent: SplashComponent,
        viewModel: RootViewModel
    ) {
        self.introComponent = introComponent
        self.mainTabComponent = mainTabComponent
        self.splashComponent = splashComponent
        _viewModel = StateObject(wrappedValue: viewModel)
    }

    public var body: some View {
        if #available(iOS 16.0, *) {
            switch appState.sceneFlow {
            case .splash:
                splashComponent.makeView()

            case .main:
                mainTabComponent.makeView()

            case .intro:
                introComponent.makeView()
            }
        } else {
            switch appState.sceneFlow {
            case .splash:
                splashComponent.makeView()

            case .main:
                mainTabComponent.makeView()

            case .intro:
                introComponent.makeView()
            }
        }
    }
}
