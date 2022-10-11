import DomainModule
import Foundation

public struct FetchSpotListUseCaseStub: FetchSpotListUseCase {
    public func execute() async throws -> [Spot] {
        [
            .init(
                id: UUID().uuidString,
                name: "최형O집",
                location: "광주광역시 북구"
            ),
            .init(
                id: UUID().uuidString,
                name: "김기O집",
                location: "인천광역시 미추홀구"
            ),
            .init(
                id: UUID().uuidString,
                name: "유나O집",
                location: "양산시 평산회야로"
            ),
            .init(
                id: UUID().uuidString,
                name: "김상O집",
                location: "대구광역시 수성구"
            )
        ]
    }
}
