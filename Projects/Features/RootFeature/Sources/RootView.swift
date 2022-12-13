import BaseFeature
import IntroFeature
import SwiftUI
import MainTabFeature
import SplashFeature
import GuestFeature

public struct RootView: View {
    @EnvironmentObject var appState: AppState
    @StateObject var viewModel: RootViewModel
    private let introComponent: IntroComponent
    private let mainTabComponent: MainTabComponent
    private let splashComponent: SplashComponent
    private let guestComponent: GuestComponent

    init(
        introComponent: IntroComponent,
        mainTabComponent: MainTabComponent,
        splashComponent: SplashComponent,
        guestComponent: GuestComponent
        viewModel: RootViewModel
    ) {
        self.introComponent = introComponent
        self.mainTabComponent = mainTabComponent
        self.splashComponent = splashComponent
        self.guestComponent = guestComponent
        _viewModel = StateObject(wrappedValue: viewModel)
    }

    public var body: some View {
        switch appState.sceneFlow {
        case .splash:
            splashComponent.makeView()

        case .main:
            mainTabComponent.makeView()

        case .intro:
            introComponent.makeView()

        case .guest:
            guestComponent.makeView()
        }
    }
}
