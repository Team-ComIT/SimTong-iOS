import SwiftUI
import DesignSystem

struct MainTabView: View {
    @State var selection = 0
    var body: some View {
        TabView(selection: $selection) {
            Text("Home")
                .tabItem {
                    STIcon(selection == 0 ? .homeFill : .home)
                    Text("홈")
                        .foregroundColor(selection == 0 ? .grayMain : .gray04)
                }
                .tag(0)
        }
    }
}

struct MainTabView_Previews: PreviewProvider {
    static var previews: some View {
        MainTabView()
    }
}
