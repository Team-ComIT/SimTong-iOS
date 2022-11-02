import Foundation

public struct SingleScheduleResponseDTO: Decodable {
    public init(id: String, title: String, startAt: String, endAt: String) {
        self.id = id
        self.title = title
        self.startAt = startAt
        self.endAt = endAt
    }

    public let id: String
    public let title: String
    public let startAt: String
    public let endAt: String

    enum CodingKeys: String, CodingKey {
        case id, title
        case startAt = "start_at"
        case endAt = "end_at"
    }
}
