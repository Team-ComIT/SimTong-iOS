import Moya
import KeychainModule
import Foundation

public struct JwtPlugin: PluginType {
    private let keychain: any Keychain

    public init(keychain: any Keychain) {
        self.keychain = keychain
    }

    public func prepare(
        _ request: URLRequest,
        target: TargetType
    ) -> URLRequest {
        guard let jwtTokenType  = (target as? JwtAuthorizable)?.jwtTokenType,
              jwtTokenType != .none
        else { return request }
        var req = request
        let token = jwtTokenType == .accessToken ?
        "Bearer \(getToken(type: .accessToken))" :
        getToken(type: .refreshToken)

        req.addValue(token, forHTTPHeaderField: jwtTokenType.rawValue)
        return req
    }

    public func didReceive(
        _ result: Result<Response, MoyaError>,
        target: TargetType
    ) {
        switch result {
        case let .success(res):
            if let new = try? res.map(TokenDTO.self) {
                saveToken(token: new)
            }
        default:
            break
        }
    }
}

private extension JwtPlugin {
    func getToken(type: KeychainType) -> String {
        switch type {
        case .accessToken:
            return keychain.load(type: .accessToken)

        case .accessTokenExp:
            return keychain.load(type: .accessTokenExp)

        case .refreshToken:
            return keychain.load(type: .refreshToken)
        }
    }

    func saveToken(token: TokenDTO) {
        keychain.save(type: .accessToken, value: token.accessToken)
        keychain.save(type: .accessTokenExp, value: token.accessTokenExp)
        keychain.save(type: .refreshToken, value: token.refreshToken)
    }
}
