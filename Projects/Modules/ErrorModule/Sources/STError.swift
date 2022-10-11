import Foundation

public enum STError: Error {
    case unknown(message: String = "알 수 없는 에러가 발생했습니다")

    // global
    case internalServerError
}

extension STError: LocalizedError {
    public var errorDescription: String? {
        switch self {
        case let .unknown(message):
            return message
        case .internalServerError:
            return "서버에서 문제가 발생했습니다"
        }
    }
}

public extension Error {
    var asSTError: STError {
        self as? STError ?? .unknown()
    }
}
