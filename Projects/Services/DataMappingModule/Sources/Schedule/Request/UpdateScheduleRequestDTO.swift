import Foundation

public struct UpdateScheduleRequestDTO: Encodable {
    public init(title: String, startAt: String, endAt: String, alarm: String) {
        self.title = title
        self.startAt = startAt
        self.endAt = endAt
        self.alarm = alarm
    }

    public let title: String
    public let startAt: String
    public let endAt: String
    public let alarm: String

    public enum CodingKeys: String, CodingKey {
        case title, alarm
        case startAt = "start_at"
        case endAt = "end_at"
    }
}
