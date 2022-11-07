import SwiftUI
import DesignSystem
import IntroFeature
import SignupFeature

@main
struct SimTongApp: App {
    init() {
        registerProviderFactories()
    }

    var body: some Scene {
        WindowGroup {
            if #available(iOS 16.0, *) {
                NavigationStack {
                    AppComponent().introComponent.makeView()
                }
            } else {
                NavigationView {
                    AppComponent().homeComponent.makeView()
                }
            }
        }
    }
}
