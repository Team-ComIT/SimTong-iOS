import DesignSystem
import DomainModule
import SwiftUI
import Utility

struct HomeView: View {
    @StateObject var viewModel: HomeViewModel
    @Namespace var calendarAnimation
    private let writeHolidayComponent: WriteHolidayComponent

    public init(
        viewModel: HomeViewModel,
        writeHolidayComponent: WriteHolidayComponent
    ) {
        _viewModel = StateObject(wrappedValue: viewModel)
        self.writeHolidayComponent = writeHolidayComponent
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

                CalendarView(holidaysDict: $viewModel.holidaysDict, scheduleDict: $viewModel.schedules) { date in
                    viewModel.onDateTap(date: date)
                }
                .matchedGeometryEffect(id: "CALENDAR", in: calendarAnimation)

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
                    Link(destination: URL(string: "https://www.google.com")!) {
                        WideCardView(image: STImage(.pay), title: "나의 급여 정보", description: "나의 급여 정보를 손쉽게 확인하세요.")
                    }

                    WideCardView(image: STImage(.holiday), title: "휴무표 작성", description: "휴무표를 작성해 일정을 손쉽게 관리해 보세요.")
                        .onTapGesture {
                            withAnimation(.spring()) {
                                viewModel.isPresentedHoliday = true
                            }
                        }
                }
                .padding(.top)
                .padding(.bottom, 30)
            }
            .padding(.horizontal, 16)
        }
        .overlay {
            if viewModel.isPresentedHoliday {
                writeHolidayComponent.makeView(
                    holidaysDict: viewModel.holidaysDict,
                    scheduleDict: viewModel.schedules,
                    isPresented: $viewModel.isPresentedHoliday,
                    calendarAnimation: calendarAnimation
                ) { holidayDict, scheduleDict in
                    viewModel.holidaysDict = holidayDict
                    viewModel.schedules = scheduleDict
                }
            } else {
                EmptyView()
            }
        }
        .onAppear {
            viewModel.onMonthChanged()
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
