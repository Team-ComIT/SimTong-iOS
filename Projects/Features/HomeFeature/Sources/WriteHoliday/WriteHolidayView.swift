import DesignSystem
import DomainModule
import SwiftUI
import Utility

struct WriteHolidayView: View {
    @StateObject var viewModel: WriteHolidayViewModel
    @Binding var isPresented: Bool
    @State var isHiddenNavigation = true
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
                ZStack {
                    HStack {
                        Image(systemName: "chevron.left")
                            .resizable()
                            .frame(width: 9, height: 16)
                            .onTapGesture {
                                withAnimation(.spring()) {
                                    isPresented = false
                                }
                            }

                        Spacer()
                    }

                    Text("휴무표 작성")
                        .stTypo(.r5, color: .grayMain)
                }
                .frame(maxWidth: .infinity)
                .padding(.horizontal, 16)

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
            isHiddenNavigation = false
            onFinished(viewModel.holidaysDict, viewModel.scheduleDict)
        }
        .navigationBarHidden(isHiddenNavigation)
        .stBackground()
        .offset(x: offset.width, y: offset.height)
        .bottomSheet(isShowing: $isPresentedHolidayPicker) {
            holidayPickerView()
        }
        .gesture(
            DragGesture()
                .onChanged { value in
                    if value.translation.width > 0 && value.translation.height > 0 {
                        offset = value.translation
                    }
                }
                .onEnded { _ in
                    if abs(offset.width) > 150 || abs(offset.height) > 150 {
                        withAnimation(.spring()) {
                            isPresented = false
                        }
                    } else {
                        withAnimation {
                            offset = .zero
                        }
                    }
                }
        )
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
                holidayColumnView(holiday: .annual) {
                    viewModel.holidaysDict[viewModel.selectedDate.toSmallSimtongDateString()] = $0
                    isPresentedHolidayPicker = false
                }

                holidayColumnView(holiday: .dayoff) {
                    viewModel.holidaysDict[viewModel.selectedDate.toSmallSimtongDateString()] = $0
                    isPresentedHolidayPicker = false
                }

                holidayColumnView(holiday: .work) {
                    viewModel.holidaysDict[viewModel.selectedDate.toSmallSimtongDateString()] = $0
                    isPresentedHolidayPicker = false
                }
            }
            .padding(.top, 32)
            .padding(.bottom, 24)
        }
        .padding(.top, 16)
        .padding(.horizontal, 24)
    }

    @ViewBuilder
    func holidayColumnView(holiday: HolidayType, onTap: @escaping (HolidayType) -> Void) -> some View {
        Button {
            onTap(holiday)
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
            return .extraPrimary

        case .annual:
            return .main

        case .work:
            return .gray04
        }
    }
}
