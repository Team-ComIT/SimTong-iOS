import Foundation

public struct ScheduleEntity: Equatable, Hashable {
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
}
