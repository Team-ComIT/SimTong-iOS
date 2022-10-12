import Foundation

public enum STError: Error {
    case unknown(message: String = "알 수 없는 에러가 발생했습니다")

    // global
    case internalServerError
    
    // emails
    case authCodeExpired
    case alreadyVerifiedEmail
    case tooManyRequestVerifyEmail
}

extension STError: LocalizedError {
    public var errorDescription: String? {
        switch self {
        case let .unknown(message):
            return message

        case .internalServerError:
            return "서버에서 문제가 발생했습니다"

        case .authCodeExpired:
            return "인증코드가 만료되었거나 일치하지 않습니다"

        case .alreadyVerifiedEmail:
            return "이미 인증된 이메일입니다"

        case .tooManyRequestVerifyEmail:
            return "인증 요청은 30분에 최대 5번 발급가능합니다"
        }
    }
}

public extension Error {
    var asSTError: STError {
        self as? STError ?? .unknown()
    }
}
