import BaseFeature
import Combine
import DomainModule
import Foundation
import Utility

public final class HomeViewModel: BaseViewModel {
    @Published var isPresentedHoliday = false
    @Published var holidaysDict: [String: HolidayType] = [:]
    @Published var schedules: [String: [ScheduleEntity]] = [:]
    @Published var menus: [MenuEntity] = []

    private let fetchMenuListUseCase: any FetchMenuListUseCase
    private let fetchScheduleUseCase: any FetchScheduleUseCase

    init(
        fetchMenuListUseCase: any FetchMenuListUseCase,
        fetchScheduleUseCase: any FetchScheduleUseCase
    ) {
        self.fetchMenuListUseCase = fetchMenuListUseCase
        self.fetchScheduleUseCase = fetchScheduleUseCase
        super.init()
        Task {
            await fetchMeals()
            await fetchSchedules()
        }
    }

    func onDateTap(date: Date) {
    }

    @MainActor
    func fetchSchedules() {
        Task {
            await withAsyncTry(with: self) { owner in
                let schedules = try await owner.fetchScheduleUseCase.execute(date: Date())
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
