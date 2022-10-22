import SwiftUI
import DesignSystem
import DomainModule
import Utility

struct CalendarView: View {
    @State var currentMonth = Date()
    @Binding var holidaysDict: [String: HolidayType]
    var onDateTap: (Date) -> Void
    let days = ["일", "월", "화", "수", "목", "금", "토"]
    let columns = Array(repeating: GridItem(.flexible()), count: 7)

    var body: some View {
        VStack {
            VStack(spacing: 24) {
                HStack {
                    Text(currentMonthString())
                        .stTypo(.m5, color: .extraBlack)

                    Spacer()

                    HStack(spacing: 36) {
                        Button {
                            withAnimation {
                                currentMonth = currentMonth.adding(by: .month, value: -1)
                            }
                        } label: {
                            Image(systemName: "chevron.left")
                                .foregroundColor(.extraBlack)
                        }

                        Button {
                            withAnimation {
                                currentMonth = currentMonth.adding(by: .month, value: 1)
                            }
                        } label: {
                            Image(systemName: "chevron.right")
                                .foregroundColor(.extraBlack)
                        }
                    }
                }

                HStack(spacing: 0) {
                    ForEach(days, id: \.self) { day in
                        Text(day)
                            .foregroundColor(dayOfWeekForeground(day: day))
                            .frame(maxWidth: .infinity)
                    }
                }

                LazyVGrid(columns: columns) {
                    ForEach(fetchAllDates(), id: \.self) { date in
                        dateRowView(date: date)
                            .onTapGesture {
                                onDateTap(date)
                            }
                    }
                }
                .animation(nil, value: currentMonth)
            }
            .padding(.horizontal, 16)
            .padding(.vertical, 24)
        }
        .gesture(
            DragGesture(minimumDistance: 1, coordinateSpace: .global)
                .onEnded { value in
                    let horizontalAmount = value.translation.width
                    withAnimation {
                        currentMonth = currentMonth.adding(by: .month, value: horizontalAmount < 0 ? 1 : -1)
                    }
                }
        )
        .background {
            Color.extraWhite
                .cornerRadius(16)
        }
    }

    @ViewBuilder
    func dateRowView(date: Date) -> some View {
        VStack {
            Text("\(date.day)")
                .underline(date.isSameDay(Date()), color: .extraBlack)
                .stTypo(.m7)
                .foregroundColor(dayOfWeekForeground(day: date.dayOfWeek()))

            Spacer()

            RoundedRectangle(cornerRadius: 8)
                .fill(dateForground(date: date))
                .frame(width: 24, height: 24)
        }
        .frame(height: 46)
        .padding(.vertical, 4)
    }

    func currentMonthString() -> String {
        let formatter = DateFormatter()
        let format = Date().isSameDay(currentMonth) ?
        "yyyy년 MM월 dd일" :
        "yyyy년 MM월"
        formatter.dateFormat = format
        return formatter.string(from: currentMonth)
    }

    func dayOfWeekForeground(day: String) -> Color {
        day == "일" || day == "토" ? .gray05 : .extraBlack
    }

    func dateForground(date: Date) -> Color {
        guard let holiday = holidaysDict[date.toSmallSimtongDateString()] else {
            return .gray02
        }

        switch holiday {
        case .dayoff:
            return .main

        case .annual:
            return .extraPrimary

        case .work:
            return .gray02
        }
    }

    func fetchAllDates() -> [Date] {
        let calendar = Calendar.current
        var days = currentMonth.fetchAllDatesInCurrentMonth()

        let prevDate = currentMonth.adding(by: .month, value: -1)
        var prevDays = prevDate.fetchAllDatesInCurrentMonth()
        let firstWeekDay = calendar.component(.weekday, from: days.first ?? .init())
        for _ in 0..<firstWeekDay - 1 {
            days.insert(prevDays.popLast() ?? .init(), at: 0)
        }

        let nextDate = currentMonth.adding(by: .month, value: 1)
        var nextDays = nextDate.fetchAllDatesInCurrentMonth()
        let lastWeekDay = calendar.component(.weekday, from: days.last ?? .init())
        for _ in 0..<7 - lastWeekDay {
            days.append(nextDays.removeFirst())
        }

        return days
    }
}
