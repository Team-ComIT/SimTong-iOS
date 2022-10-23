import DomainModule
import Foundation

public struct FetchSpotListUseCaseStub: FetchSpotListUseCase {
    public init() {}

    public func execute() async throws -> [SpotEntity] {
        [
            .init(
                id: "ADMLWLQ",
                name: "A의 집",
                location: "광주광역시 북구"
            ),
            .init(
                id: "BDMLWLQ",
                name: "B의 집",
                location: "인천광역시 미추홀구"
            ),
            .init(
                id: "CDMLWLQ",
                name: "C의 집",
                location: "양산시 평산회야로"
            ),
            .init(
                id: "DDMLWLQ",
                name: "D의 집",
                location: "대구광역시 수성구"
            )
        ]
    }
}
