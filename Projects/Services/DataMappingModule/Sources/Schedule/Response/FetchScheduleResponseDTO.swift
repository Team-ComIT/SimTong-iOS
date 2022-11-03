import Foundation

public struct FetchScheduleResponseDTO: Decodable {
    public init(schedules: [SingleScheduleResponseDTO]) {
        self.schedules = schedules
    }

    public let schedules: [SingleScheduleResponseDTO]
}
