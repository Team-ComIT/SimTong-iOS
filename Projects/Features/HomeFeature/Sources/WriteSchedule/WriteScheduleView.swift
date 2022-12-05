import DesignSystem
import DomainModule
import SwiftUI
import Utility

struct WriteScheduleView: View {
    @StateObject var viewModel: WriteScheduleViewModel
    @State var offset: CGSize = .init(width: 0, height: 0)
    @Binding var isPresented: Bool
    var scheduleAnimation: Namespace.ID
    let onFinished: (
        [String: HolidayType],
        [String: [ScheduleEntity]]
    ) -> Void

    init(
        viewModel: WriteScheduleViewModel,
        isPresented: Binding<Bool>,
        scheduleAnimation: Namespace.ID,
        onFinished: @escaping (
            [String: HolidayType],
            [String: [ScheduleEntity]]
        ) -> Void
    ) {
        _viewModel = StateObject(wrappedValue: viewModel)
        _isPresented = isPresented
        self.scheduleAnimation = scheduleAnimation
        self.onFinished = onFinished
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

                    Image(systemName: "plus")
                        .foregroundColor(.gray05)
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
        .stBackground()
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

            Image(systemName: "ellipsis")
                .foregroundColor(.gray05)
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
        formatter.timeZone = TimeZone(identifier: "UTC")
        return formatter.string(from: date)
    }
}
