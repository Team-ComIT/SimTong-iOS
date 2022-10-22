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

    func onDateTap(date: Date) {
    }
}
