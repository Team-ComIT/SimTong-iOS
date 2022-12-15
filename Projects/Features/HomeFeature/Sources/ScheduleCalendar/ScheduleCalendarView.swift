import DesignSystem
import DomainModule
import SwiftUI
import Utility

struct ScheduleCalendarView: View {
    @StateObject var viewModel: ScheduleCalendarViewModel
    @State var offset: CGSize = .init(width: 0, height: 0)
    @Binding var isPresented: Bool
    var scheduleAnimation: Namespace.ID
    let onFinished: (
        [String: HolidayType],
        [String: [ScheduleEntity]]
    ) -> Void
    private let composeScheduleComponent: ComposeScheduleComponent

    init(
        viewModel: ScheduleCalendarViewModel,
        isPresented: Binding<Bool>,
        scheduleAnimation: Namespace.ID,
        onFinished: @escaping (
            [String: HolidayType],
            [String: [ScheduleEntity]]
        ) -> Void,
        composeScheduleComponent: ComposeScheduleComponent
    ) {
        _viewModel = StateObject(wrappedValue: viewModel)
        _isPresented = isPresented
        self.scheduleAnimation = scheduleAnimation
        self.onFinished = onFinished
        self.composeScheduleComponent = composeScheduleComponent
    }

    var body: some View {
        ScrollView {
            VStack {
                if isPresented {
                    CalendarView(
                        holidaysDict: $viewModel.holidaysDict,
                        scheduleDict: $viewModel.scheduleDict
                    ) { date in
                        withAnimation {
                            viewModel.dateOnTap(date: date)
                        }
                    }
                    .matchedGeometryEffect(id: "SCHEDULE", in: scheduleAnimation)
                    .padding(.top, 8)
                }

                HStack {
                    if let selectedDate = viewModel.selectedDate {
                        Text(scheduleDateFormatting(date: selectedDate))
                            .stTypo(.m5, color: .extraBlack)
                    } else {
                        Text("전체일정")
                            .stTypo(.m5, color: .extraBlack)
                    }

                    Spacer()

                    NavigationLink {
                        DeferView {
                            composeScheduleComponent.makeView(selectedDate: viewModel.selectedDate) {
                                viewModel.onAppear()
                            }
                        }
                    } label: {
                        Image(systemName: "plus")
                            .foregroundColor(.gray05)
                    }

                }
                .padding(.top, 8)

                LazyVStack(spacing: 16) {
                    ForEach(viewModel.filteredScheduleList, id: \.id) { schedule in
                        scheduleRowView(schedule: schedule)
                    }
                }
            }
            .padding(.top, 12)
            .padding(.horizontal, 16)
        }
        .offset(x: offset.width)
        .onBackSwipe(offset: $offset) {
            withAnimation(.spring()) {
                isPresented = false
            }
        }
        .navigationBarTitleDisplayMode(.inline)
        .toolbar {
            ToolbarItem(placement: .principal) {
                Text("일정 작성")
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
        .onDisappear {
            onFinished(viewModel.holidaysDict, viewModel.scheduleDict)
        }
        .navigate(
            to: composeScheduleComponent.makeView(
                selectedDate: viewModel.selectedDate,
                updateTarget: viewModel.selectedSchedule,
                completion: {
                    viewModel.onAppear()
                }
            ),
            when: $viewModel.isNavigateUpdateSchedule
        )
        .bottomSheet(isShowing: $viewModel.isPresentedScheduleOptionPicker) {
            scheduleOptionPickerView()
        }
        .bottomSheet(isShowing: $viewModel.isPresentedScheduleDeleteConfirm) {
            scheduleDeleteCheckView()
        }
        .stBackground()
    }

    @ViewBuilder
    func scheduleOptionPickerView() -> some View {
        VStack(spacing: 20) {
            Button {
                viewModel.scheduleUpdateButtonDidTap()
            } label: {
                scheduleOptionRowView(system: "pencil", title: "수정")
                    .foregroundColor(.grayMain)
            }

            Button {
                viewModel.scheduleDeleteButtonDidTap()
            } label: {
                scheduleOptionRowView(system: "trash", title: "삭제")
                    .foregroundColor(.main)
            }

        }
        .padding(.horizontal, 24)
        .padding(.top, 32)
        .padding(.bottom, 20)
    }

    @ViewBuilder
    func scheduleOptionRowView(system: String, title: String) -> some View {
        HStack {
            Image(systemName: system)

            Text(title)

            Spacer()
        }
    }

    @ViewBuilder
    func scheduleDeleteCheckView() -> some View {
        VStack {
            if let schedule = viewModel.selectedSchedule {
                let year = "\(schedule.startAt.toSmallSimtongDate().year)"
                let month = schedule.startAt.toSmallSimtongDate().month
                let day = schedule.startAt.toSmallSimtongDate().day
                HStack {
                    Text("**\(year)년 \(month)월 \(day)일 \(schedule.title)**\n일정을 삭제합니다.")

                    Spacer()
                }
            } else {
                EmptyView()
            }

            HStack {
                CTAButton(text: "취소", style: .cancel) {
                    viewModel.isPresentedScheduleDeleteConfirm = false
                }

                CTAButton(text: "삭제") {
                    viewModel.scheduleDeleteConfirmButtonDidTap()
                }
            }
        }
        .onAppear {
            viewModel.fetchSchedules()
        }
        .padding([.horizontal, .bottom], 16)
        .padding(.top, 24)
    }

    @ViewBuilder
    func scheduleRowView(schedule: ScheduleEntity) -> some View {
        HStack(alignment: .center, spacing: 8) {
            VStack {
                Circle()
                    .fill(Color.main)
                    .frame(width: 8, height: 8)
                    .offset(y: 4)

                Spacer()
            }

            VStack(alignment: .leading, spacing: 4) {
                Text(schedule.title)
                    .stTypo(.r6, color: .extraBlack)

                Text(
                    scheduleDateString(
                        start: schedule.startAt.toSmallSimtongDate(),
                        end: schedule.endAt.toSmallSimtongDate()
                    )
                )
                .stTypo(.r7, color: .main)
            }

            Spacer()

            Button {
                viewModel.scheduleOptionButtonDidTap(schedule: schedule)
            } label: {
                Image(systemName: "ellipsis")
                    .foregroundColor(.gray05)
            }

        }
    }

    func scheduleDateString(start: Date, end: Date) -> String {
        let startString: String
        if start.compare(Date()) == .orderedAscending || start.compare(Date()) == .orderedSame {
            startString = "today"
        } else {
            startString = scheduleDateFormatting(date: start)
        }

        return "\(startString) ~ \(scheduleDateFormatting(date: end))"
    }

    func scheduleDateFormatting(date: Date) -> String {
        let formatter = DateFormatter()
        formatter.dateFormat = "yyyy.MM.dd"
        formatter.locale = Locale(identifier: "ko_kr")
        return formatter.string(from: date)
    }
}
