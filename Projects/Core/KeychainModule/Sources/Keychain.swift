import ComposableArchitecture
import Foundation

public enum KeychainType: String {
    case accessToken = "ACCESS-TOKEN"
    case accessTokenExp = "ACCESS-TOKEN-EXP"
    case refreshToken = "REFRESH-TOKEN"
}

public struct Keychain {
    public var save: (_ type: KeychainType, _ value: String) -> Void
    public var load: (_ type: KeychainType) -> String
    public var delete: (_ type: KeychainType) -> Void
}

extension Keychain: DependencyKey {
    public static var liveValue: Keychain = Keychain { type, value in
        let service: String = Bundle.main.bundleIdentifier ?? ""
        let query: NSDictionary = [
            kSecClass: kSecClassGenericPassword,
            kSecAttrService: service,
            kSecAttrAccount: type.rawValue,
            kSecValueData: value.data(using: .utf8, allowLossyConversion: false) ?? .init()
        ]
        SecItemDelete(query)
        SecItemAdd(query, nil)
    } load: { type in
        let service: String = Bundle.main.bundleIdentifier ?? ""
        let query: NSDictionary = [
            kSecClass: kSecClassGenericPassword,
            kSecAttrService: service,
            kSecAttrAccount: type.rawValue,
            kSecReturnData: kCFBooleanTrue!,
            kSecMatchLimit: kSecMatchLimitOne
        ]
        var dataTypeRef: AnyObject?
        let status = withUnsafeMutablePointer(to: &dataTypeRef) { SecItemCopyMatching(query, UnsafeMutablePointer($0)) }
        if status == errSecSuccess {
            guard let data = dataTypeRef as? Data else { return "" }
            return String(data: data, encoding: .utf8) ?? ""
        }
        return ""
    } delete: { type in
        let service: String = Bundle.main.bundleIdentifier ?? ""
        let query: NSDictionary = [
            kSecClass: kSecClassGenericPassword,
            kSecAttrService: service,
            kSecAttrAccount: type.rawValue
        ]
        SecItemDelete(query)
    }

    public static var testValue: Keychain = Keychain { _, _ in
    } load: { type in
        "token"
    } delete: { _ in }

}

extension DependencyValues {
    public var keychain: Keychain {
        get { self[Keychain.self] }
        set { self[Keychain.self] = newValue }
    }
}
