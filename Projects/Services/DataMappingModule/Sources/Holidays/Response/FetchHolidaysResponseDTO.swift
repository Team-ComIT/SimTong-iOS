import Foundation

public struct FetchHolidayResponseDTO: Decodable {
    public let holidays: [SingleHolidayResponseDTO]
}
