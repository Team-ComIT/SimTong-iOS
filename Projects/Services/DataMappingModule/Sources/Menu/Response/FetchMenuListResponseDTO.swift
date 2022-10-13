import Foundation

public struct FetchMenuListResponseDTO: Decodable {
    public init(menu: [SingleMenuResponseDTO]) {
        self.menu = menu
    }

    public let menu: [SingleMenuResponseDTO]
}
