import SwiftUI
import DesignSystem
import HomeFeature

struct MainTabView: View {
    @State var selection = 0

    private let homeComponent: HomeComponent

    init(homeComponent: HomeComponent) {
        self.homeComponent = homeComponent
    }

    var body: some View {
        homeComponent.makeView()
    }
}
