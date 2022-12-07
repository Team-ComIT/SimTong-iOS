import Foundation
import KeychainModule

public final class LocalUsersDataSourceImpl: BaseLocalDataSource, LocalUsersDataSource {

    private let keychain: Keychain

    public init(keychain: any Keychain) {
        self.keychain = keychain
    }

    public func logout() {
        keychain.delete(type: .refreshToken)
        keychain.delete(type: .accessToken)
        keychain.delete(type: .accessTokenExp)
    }
}
