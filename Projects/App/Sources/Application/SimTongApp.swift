import BaseFeature
import DesignSystem
import IntroFeature
import SwiftUI
import SignupFeature

@main
struct SimTongApp: App {
    @StateObject private var appState = AppState()

    init() {
        registerProviderFactories()
    }

    var body: some Scene {
        WindowGroup {
            AppComponent().rootComponent.makeView()
                .environmentObject(appState)
        }
    }
}
