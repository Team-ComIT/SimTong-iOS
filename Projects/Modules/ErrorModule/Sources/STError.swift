import Foundation

public enum STError: Error {
    case unknown(message: String = "알 수 없는 에러가 발생했습니다")
}

extension STError: LocalizedError {
    public var errorDescription: String? {
        switch self {
        case let .unknown(message):
            return message
        }
    }
}

public extension Error {
    var asSTError: STError {
        self as? STError ?? .unknown()
    }
}
