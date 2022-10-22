import DesignSystem
import DomainModule
import SwiftUI
import Utility

struct HomeView: View {
    @StateObject var viewModel: HomeViewModel

    public init(viewModel: HomeViewModel) {
        _viewModel = StateObject(wrappedValue: viewModel)
    }

    var body: some View {
        ScrollView(showsIndicators: false) {
            VStack(alignment: .leading, spacing: 8) {
                HStack(spacing: 12) {
                    Text("캘린더")
                        .stTypo(.r3, color: .extraBlack)

                    Image(systemName: "chevron.right")
                        .foregroundColor(.extraBlack)
                }

                CalendarView(holidaysDict: $viewModel.holidaysDict)

                Text("직원 식당 메뉴")
                    .stTypo(.r4, color: .extraBlack)
                    .padding(.top, 32)

                ScrollView(.horizontal) {
                    LazyHStack(spacing: 8) {
                        ForEach(viewModel.menus, id: \.date) { menu in
                            menuColumnView(menu: menu)
                        }
                    }
                }
            }
            .padding(.horizontal, 16)
        }
        .stBackground()
    }

    @ViewBuilder
    func menuColumnView(menu: MenuEntity) -> some View {
        VStack(alignment: .leading) {
            VStack(alignment: .leading, spacing: 8) {
                Text("\(menu.date.toSmallSimtongDate().month)월 \(menu.date.toSmallSimtongDate().day)일")
                    .stTypo(.r7, color: .extraBlack)
                    .padding(.bottom, 8)

                ForEach(menu.meal, id: \.self) { meal in
                    Text(meal)
                        .stTypo(.m5, color: .grayMain)
                        .frame(maxHeight: .infinity)
                }
            }
            .padding(20)
        }
        .frame(width: 168, height: 272)
        .background {
            STImage(.rice, renderingMode: .original)
        }
        .cornerRadius(16)
    }
}
