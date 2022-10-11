import SwiftUI
import DesignSystem
import IntroFeature

@main
struct SimTongApp: App {
    @State var isRootActive = false
    init() {
        registerProviderFactories()
    }

    var body: some Scene {
        WindowGroup {
            NavigationView {
                NavigationLink(isActive: $isRootActive) {
                    AppComponent().findAuthInfoComponent.makeView()
                } label: {
                    Text("Asdi")
                        .onTapGesture {
                            isRootActive.toggle()
                        }
                }
            }
            .environment(\.rootPresentationMode, $isRootActive)
        }
    }
}
