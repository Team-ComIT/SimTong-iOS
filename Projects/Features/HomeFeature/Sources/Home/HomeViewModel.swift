import BaseFeature
import Combine
import DomainModule
import Foundation
import Utility

public final class HomeViewModel: BaseViewModel {
    @Published var isPresentedHoliday = false
    @Published var isPresentedSchedule = false
    @Published var holidaysDict: [String: HolidayType] = [:]
    @Published var schedules: [String: [ScheduleEntity]] = [:]
    @Published var menus: [MenuEntity] = []
    @Published var isPresentedMyPage = false
    let salaryURL: URL = URL(
        string: Bundle.main.object(forInfoDictionaryKey: "SALARY_URL") as? String ?? ""
    ) ?? URL(string: "https://www.google.com")!
    private let fetchMenuListUseCase: any FetchMenuListUseCase
    private let fetchScheduleUseCase: any FetchScheduleUseCase

    init(
        fetchMenuListUseCase: any FetchMenuListUseCase,
        fetchScheduleUseCase: any FetchScheduleUseCase
    ) {
        self.fetchMenuListUseCase = fetchMenuListUseCase
        self.fetchScheduleUseCase = fetchScheduleUseCase
        super.init()
        homeDataInit()
    }

    func homeDataInit() {
        Task {
            async let meal: () = fetchMeals()
            async let schedule: () = fetchSchedules()
            _ = await [meal, schedule]
        }
    }

    func onDateTap(date: Date) {
        isPresentedSchedule = true
    }

    @MainActor
    func fetchSchedules() {
        Task {
            await withAsyncTry(with: self) { owner in
                owner.schedules = .init()
                let schedules = try await owner.fetchScheduleUseCase.execute(date: Date())
                for schedule in schedules {
                    var start = schedule.startAt.toSmallSimtongDate()
                    let end = schedule.endAt.toSmallSimtongDate().adding(by: .day, value: 1)
                    if owner.schedules[schedule.startAt] == nil {
                        owner.schedules[schedule.startAt] = [schedule]
                    } else {
                        owner.schedules[schedule.startAt]?.append(schedule)
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

    @MainActor
    func fetchMeals() {
        Task {
            await withAsyncTry(with: self) { owner in
                let menus = try await owner.fetchMenuListUseCase.execute(date: .init())
                owner.menus = menus
            }
        }
    }
}
