import ComposableArchitecture
import Foundation
import KeychainModule
import Moya

public final class JWTPlugin: PluginType {
    @Dependency(\.keychain) var keychain

    public init() {}

    public func prepare(
        _ request: URLRequest,
        target: TargetType
    ) -> URLRequest {
        guard let jwtTokenType = (target as? JwtAuthorizable)?.jwtTokenType,
              jwtTokenType != .none
        else {
            return request
        }
        var newRequest = request
        let token = jwtTokenType == .accessToken ?
        "Bearer \(getToken(type: .accessToken))" :
        getToken(type: .refreshToken)
        newRequest.addValue(token, forHTTPHeaderField: jwtTokenType.rawValue)
        return newRequest
    }
}

private extension JWTPlugin {
    func getToken(type: KeychainType) -> String {
        switch type {
        case .accessToken:
            return keychain.load(.accessToken)

        case .accessTokenExp:
            return keychain.load(.accessTokenExp)

        case .refreshToken:
            return keychain.load(.refreshToken)
        }
    }

    func saveToken(token: JwtTokenResponseDTO) {
        keychain.save(.accessToken, token.accessToken)
        keychain.save(.accessTokenExp, token.accessTokenExp)
        keychain.save(.refreshToken, token.refreshToken)
    }
}
