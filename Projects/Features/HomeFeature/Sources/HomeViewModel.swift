import BaseFeature
import Combine
import DomainModule
import Foundation
import Utility

public final class HomeViewModel: BaseViewModel {
    @Published var holidaysDict: [String: HolidayType] = [
        "2022-10-23": .annual,
        "2022-10-05": .dayoff,
        "2022-10-24": .dayoff,
        "2022-10-25": .annual
    ]
}
