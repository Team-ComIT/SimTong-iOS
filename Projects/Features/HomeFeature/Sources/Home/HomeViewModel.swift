import BaseFeature
import Combine
import DomainModule
import Foundation
import Utility

public final class HomeViewModel: BaseViewModel {
    @Published var isPresentedHoliday = false
    @Published var holidaysDict: [String: HolidayType] = [
        "2022-10-23": .annual,
        "2022-10-05": .dayoff,
        "2022-10-24": .dayoff,
        "2022-10-25": .annual
    ]
    @Published var schedules: [String: [ScheduleEntity]] = [:]
    @Published var menus: [MenuEntity] = [
        .init(
            date: "2022-10.22",
            meal: [
                "깍두기",
                "양배추샐러드&사우전드아일랜드",
                "베이컨김치볶음밥",
                "감자수제비국",
                "옛날통닭",
                "계란후라이",
                "쥬시쿨"
            ]
        ),
        .init(
            date: "2022-10.23",
            meal: [
                "깍두기",
                "양배추샐러드&사우전드아일랜드",
                "베이컨김치볶음밥",
                "감자수제비국",
                "옛날통닭",
                "계란후라이",
                "쥬시쿨"
            ]
        ),
        .init(
            date: "2022-10.24",
            meal: [
                "깍두기",
                "양배추샐러드&사우전드아일랜드",
                "베이컨김치볶음밥",
                "감자수제비국",
                "옛날통닭",
                "계란후라이",
                "쥬시쿨"
            ]
        ),
        .init(
            date: "2022-10.25",
            meal: [
                "깍두기",
                "양배추샐러드&사우전드아일랜드",
                "베이컨김치볶음밥",
                "감자수제비국",
                "옛날통닭",
                "계란후라이",
                "쥬시쿨"
            ]
        )
    ]

    public override init() {
        super.init()
    }

    func onDateTap(date: Date) {
    }

    @MainActor
    func onMonthChanged() {
        Task {
            await withAsyncTry(with: self) { owner in
                let schedules = [
                    ScheduleEntity(
                        id: UUID().uuidString,
                        title: "asdafa",
                        startAt: "2022-10-23",
                        endAt: "2022-10-30"
                    ),
                    ScheduleEntity(
                        id: UUID().uuidString,
                        title: "asdafa",
                        startAt: "2022-10-30",
                        endAt: "2022-11-28"
                    ),
                    ScheduleEntity(
                        id: UUID().uuidString,
                        title: "asdafa",
                        startAt: "2022-10-23",
                        endAt: "2022-12-12"
                    ),
                    ScheduleEntity(
                        id: UUID().uuidString,
                        title: "asdafa",
                        startAt: "2022-10-23",
                        endAt: "2023-01-02"
                    )
                ]
                for schedule in schedules {
                    var start = schedule.startAt.toSmallSimtongDate()
                    let end = schedule.endAt.toSmallSimtongDate()
                    if owner.schedules[schedule.startAt] == nil {
                        owner.schedules[schedule.startAt] = [schedule]
                    }
                    start = start.adding(by: .day, value: 1)
                    while !start.isSameDay(end) {
                        if owner.schedules[start.toSmallSimtongDateString()] == nil {
                            owner.schedules[start.toSmallSimtongDateString()] = [schedule]
                        } else {
                            owner.schedules[start.toSmallSimtongDateString()]?.append(schedule)
                        }

                        start = start.adding(by: .day, value: 1)
                    }
                }
            }
        }
    }
}
