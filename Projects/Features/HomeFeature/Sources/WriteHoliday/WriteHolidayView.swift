import DesignSystem
import SwiftUI

struct WriteHolidayView: View {
    @StateObject var viewModel: WriteHolidayViewModel
    @Binding var isPresented: Bool
    @State var isHiddenNavigation = true
    @State var offset: CGSize = .init(width: 0, height: 0)
    @State var isPresentedHolidayPicker = false
    var calendarAnimation: Namespace.ID

    init(
        viewModel: WriteHolidayViewModel,
        isPresented: Binding<Bool>,
        calendarAnimation: Namespace.ID
    ) {
        _viewModel = StateObject(wrappedValue: viewModel)
        _isPresented = isPresented
        self.calendarAnimation = calendarAnimation
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

                Button {
                } label: {
                    Text("저장")
                        .stTypo(.r6, color: .main)
                }
            }
            .padding(.bottom, 130)
        }
        .padding(.top, 16)
        .padding(.horizontal, 24)
    }
}
