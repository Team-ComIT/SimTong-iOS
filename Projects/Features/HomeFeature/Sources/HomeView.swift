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
                            MenuCardView(menu: menu)
                        }
                    }
                }

                VStack(alignment: .leading, spacing: 8) {
                    WideCardView(image: STImage(.pay), title: "나의 급여 정보", description: "나의 급여 정보를 손쉽게 확인하세요.")

                    WideCardView(image: STImage(.holiday), title: "휴무표 작성", description: "휴무표를 작성해 일정을 손쉽게 관리해 보세요.")
                }
                .padding(.top)
                .padding(.bottom, 30)
            }
            .padding(.horizontal, 16)
        }
        .stBackground()
        .toolbar {
            ToolbarItemGroup(placement: .navigationBarTrailing) {
                Button {
                } label: {
                    STIcon(.bell, color: .gray03)
                }

                Button {
                } label: {
                    STIcon(.person, color: .gray03)
                }
            }
        }
    }
}
