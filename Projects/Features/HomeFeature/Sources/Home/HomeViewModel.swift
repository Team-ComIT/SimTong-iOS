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
    @Published var salaryURL: URL = URL(string: """
https://em.sungsimdang.co.kr:8443/account?error_msg=this+bean+name+is+undefined&productCode=erpiu&langText=%7B%7D&headerLoginBI=%2FcustomImage%2Fh_logo_en_rosso.png&centerLoginImage=%2FcustomImage%2Fimg_visual_en_rosso.jpg&defaultCompanyCode=&defaultGroupCode=&defaultUserId=&defaultPassword=&lang=ko&headerBI=%2FcustomImage%2Fh_logo_rosso.png&headerTitleText=ERP-iU+Web&scriptBaseRoot=%2Fdews%2F&contextRoot=%2F&dateFormat=yyyy%2FMM%2Fdd&dateTimeFormat=yyyy%2FMM%2Fdd+HH%3Amm%3Ass&monthFormat=yyyy%2FMM&defaultMainImage=%2FcustomImage%2Fmain_visual_rosso.jpg&defaultMainImageHeight=850
""") ?? URL(string: "https://www.google.com")!

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
                let schedules = try await owner.fetchScheduleUseCase.execute(date: Date())
                for schedule in schedules {
                    var start = schedule.startAt.toSmallSimtongDate()
                    let end = schedule.endAt.toSmallSimtongDate().adding(by: .day, value: 1)
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
