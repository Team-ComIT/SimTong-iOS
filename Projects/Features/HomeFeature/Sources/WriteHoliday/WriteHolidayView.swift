import DesignSystem
import DomainModule
import SwiftUI
import Utility

struct WriteHolidayView: View {
    @StateObject var viewModel: WriteHolidayViewModel
    @Binding var isPresented: Bool
    @State var offset: CGSize = .init(width: 0, height: 0)
    @State var isPresentedHolidayPicker = false
    var calendarAnimation: Namespace.ID
    let onFinished: (
        [String: HolidayType],
        [String: [ScheduleEntity]]
    ) -> Void

    init(
        viewModel: WriteHolidayViewModel,
        isPresented: Binding<Bool>,
        calendarAnimation: Namespace.ID,
        onFinished: @escaping (
            [String: HolidayType],
            [String: [ScheduleEntity]]
        ) -> Void
    ) {
        _viewModel = StateObject(wrappedValue: viewModel)
        _isPresented = isPresented
        self.calendarAnimation = calendarAnimation
        self.onFinished = onFinished
    }

    var body: some View {
        ScrollView(showsIndicators: false) {
            VStack {
                if isPresented {
                    CalendarView(
                        holidaysDict: $viewModel.holidaysDict,
                        scheduleDict: $viewModel.scheduleDict
                    ) { date in
                        viewModel.selectedDate = date
                        withAnimation {
                            isPresentedHolidayPicker = true
                        }
                    }
                    .matchedGeometryEffect(id: "CALENDAR", in: calendarAnimation)
                    .padding(.top, 8)
                }
            }
            .padding(.top, 12)
            .padding(.horizontal, 16)
        }
        .onDisappear {
            onFinished(viewModel.holidaysDict, viewModel.scheduleDict)
        }
        .stBackground()
        .bottomSheet(isShowing: $isPresentedHolidayPicker) {
            holidayPickerView()
        }
        .offset(x: offset.width)
        .toolbar {
            ToolbarItem(placement: .principal) {
                Text("휴무표 작성")
                    .font(.headline)
            }
            ToolbarItemGroup(placement: .navigationBarLeading) {
                Button {
                    withAnimation(.spring()) {
                        isPresented = false
                    }
                } label: {
                    Image(systemName: "chevron.left")
                        .resizable()
                        .frame(width: 9, height: 16)
                        .foregroundColor(.grayMain)
                }
            }
        }
        .onBackSwipe(offset: $offset) {
            withAnimation(.spring()) {
                isPresented = false
            }
        }
        .alert("", isPresented: $viewModel.isError) {
            Button("확인", role: .cancel) {}
        } message: {
            Text(viewModel.errorMessage)
        }
    }

    @ViewBuilder
    func holidayPickerView() -> some View {
        VStack {
            HStack {
                Text(viewModel.selectedDateHolidayText)
                    .stTypo(.r6, color: .extraBlack)

                Spacer()
            }

            HStack(spacing: 32) {
                ForEach([HolidayType.dayoff, .annual, .work], id: \.hashValue) {
                    holidayColumnView(holiday: $0)
                }
            }
            .padding(.top, 32)
            .padding(.bottom, 24)
        }
        .padding(.top, 16)
        .padding(.horizontal, 24)
    }

    @ViewBuilder
    func holidayColumnView(holiday: HolidayType) -> some View {
        Button {
            viewModel.writeHoliday(type: holiday)
            isPresentedHolidayPicker = false
        } label: {
            VStack(spacing: 8) {
                RoundedRectangle(cornerRadius: 18)
                    .fill(holidayColor(holiday: holiday))
                    .frame(width: 56, height: 56)
                    .overlay {
                        Text(holiday.shortDisplay)
                            .stTypo(.r5, color: .extraWhite)
                    }

                Text(holiday.display)
                    .stTypo(.r7, color: .gray07)
            }
        }
    }

    func holidayColor(holiday: HolidayType) -> Color {
        switch holiday {
        case .dayoff:
            return .main

        case .annual:
            return .extraPrimary

        case .work:
            return .gray04
        }
    }
}
