import Foundation

struct JwtTokenResponseDTO: Decodable, Equatable {
    let accessToken: String
    let accessTokenExp: String
    let refreshToken: String

    enum CodingKeys: String, CodingKey {
        case accessToken = "access_token"
        case accessTokenExp = "access_token_exp"
        case refreshToken = "refresh_token"
    }
}
