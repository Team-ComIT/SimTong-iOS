import Foundation

public enum STError: Error, Equatable {
    case unknown(message: String = "알 수 없는 에러가 발생했습니다")

    // global
    case internalServerError
    case accessTokenExpired

    // common
    case notFoundUserByFindEmployeeNumber
    case emailIsNotAuthorizedOrMismatch
    case notFoundUserByResetPassword
    case passwordMismatchByChangePassword
    case alreadyExistsByEmailOverlap
    case notFoundUserByCheckNameAndEmail
    case notFoundUserByComparePassword
    case tooManyChangeSpot

    // users
    case notFoundUserBySignin
    case passwordMismatch
    case emailIsNotAuthorized
    case userInfoIsAlreadyExistBySignup
    case notExistsUserByVerifyEmployee
    case alreadyExistNicknameByChangeNickname
    case alreadyExistEmailByChangeEmail
    case alreadyExistNickname

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

        case .accessTokenExpired:
            return "세션이 만료되었습니다. 다시 로그인해주세요!"

        // MARK: - Common
        case .notFoundUserByFindEmployeeNumber:
            return "입력한 정보에 따른 회원을 찾지 못했습니다"

        case .emailIsNotAuthorizedOrMismatch:
            return "이메일이 인증되지 않았거나 계정 이메일과 일치하지 않습니다"

        case .notFoundUserByResetPassword:
            return "사원번호에 따른 유저를 찾을 수 없습니다"

        case .notFoundUserBySignin:
            return "사원번호에 따른 유저를 찾을 수 없습니다"

        case .notFoundUserByCheckNameAndEmail:
            return "이름과 이메일에 따른 유저를 찾을 수 없습니다"

        case .notFoundUserByComparePassword:
            return "비밀번호에 따른 유저를 찾을 수 없습니다"

        case .tooManyChangeSpot:
            return "근무 지점 변경은 90일 최대 3번 변경 가능합니다."

        // MARK: - Users
        case .passwordMismatch:
            return "비밀번호가 일치하지 않습니다"

        case .emailIsNotAuthorized:
            return "이메일이 인증되지 않았습니다"

        case .userInfoIsAlreadyExistBySignup:
            return "이메일 또는 사원번호, 또는 닉네임이 이미 사용중입니다"

        case .notExistsUserByVerifyEmployee:
            return "이름과 사번 정보가 일치하지 않습니다"

        case .passwordMismatchByChangePassword:
            return "비밀번호가 일치하지 않습니다"

        case .alreadyExistNicknameByChangeNickname:
            return "닉네임이 이미 사용중입니다"

        case .alreadyExistEmailByChangeEmail:
            return "이메일이 이미 사용중입니다"

        case .alreadyExistsByEmailOverlap:
            return "이메일이 이미 사용중입니다"

        case .alreadyExistNickname:
            return "닉네임이 이미 사용중입니다"

        // MARK: - Emails
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
