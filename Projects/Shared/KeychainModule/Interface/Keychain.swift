import Foundation

public enum KeychainType: String {
    case accessToken = "ACCESS-TOKEN"
    case accessTokenExp = "ACCESS-TOKEN-EXP"
    case refreshToken = "REFRESH-TOKEN"
    case refreshTokenExp = "REFRESH-TOKEN-EXP"
}

public protocol Keychain {
    func save(type: KeychainType, value: String)
    func load(type: KeychainType) -> String
    func delete(type: KeychainType)
}
