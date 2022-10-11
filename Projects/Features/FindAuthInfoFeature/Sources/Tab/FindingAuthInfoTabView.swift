import SwiftUI
import DesignSystem

public struct FindingAuthInfoTabView: View {
    @State var currentTab: Int = 0

    public var body: some View {
        VStack {
            TabbarView(currentTab: $currentTab, tabbarItems: [
                "사원번호 찾기", "비밀번호 찾기"
            ])

            TabView(selection: $currentTab) {
                Text("0")
                    .tag(0)

                Text("1")
                    .tag(1)
            }
            .tabViewStyle(.page(indexDisplayMode: .never))
            .ignoresSafeArea()
        }
    }
}

private struct TabbarView: View {
    @Binding var currentTab: Int
    let tabbarItems: [String]
    @Namespace var animation

    var body: some View {
        VStack(spacing: .zero) {
            HStack {
                Spacer()

                ForEach(tabbarItems.indices, id: \.self) { index in
                    Button {
                        withAnimation(.spring()) {
                            currentTab = index
                        }
                    } label: {
                        Text(tabbarItems[index])
                            .stTypo(.m5, color: currentTab == index ? .grayMain : .gray05)
                            .padding(.vertical, 20)
                            .overlay {
                                if currentTab == index {
                                    Color.grayMain
                                        .frame(height: 2)
                                        .cornerRadius(32)
                                        .offset(y: 29)
                                        .matchedGeometryEffect(id: "TAB", in: animation, properties: .frame)
                                } else {
                                    Color.clear
                                        .frame(height: 2)
                                }
                            }
                            .animation(.spring(), value: currentTab)
                    }

                    Spacer()
                }
            }

            Rectangle()
                .fill(Color.gray05)
                .frame(height: 0.5)
        }
    }
}

struct FindingAuthInfoTabView_Previews: PreviewProvider {
    static var previews: some View {
        NavigationView {
            FindingAuthInfoTabView()
        }
    }
}
