import Foundation
import KeychainModuleInterface

public final class FakeKeyChain: Keychain {
    public init() {}
    public var store: [String: String] = [:]

    public func save(type: KeychainType, value: String) {
        store[type.rawValue] = value
    }

    public func load(type: KeychainType) -> String {
        store[type.rawValue] ?? ""
    }

    public func delete(type: KeychainType) {
        store[type.rawValue] = nil
    }
}
