import Foundation

public enum STError: Error {
    case unknown(message: String)
}

extension STError: LocalizedError {
    public var errorDescription: String? {
        switch self {
        case let .unknown(message):
            return message
        }
    }
}
