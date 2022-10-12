import Moya
import DataMappingModule
import ErrorModule

public enum UsersAPI: SimTongAPI {
    case signin(SigninRequestDTO)
    case signup(SignupRequestDTO)
    case existsByNameAndEmployeeNumber(name: String, employeeNumber: Int)
    case fetchMyProfile
    case changePassword(ChangePasswordRequestDTO)
    case changeNickname(nickname: String)
    case changeEmail(email: String)
    case changeProfileImage(imageURL: String)
    case changeSpot(spotID: String)
}

public extension UsersAPI {
    var domain: SimTongDomain {
        .users
    }

    var urlPath: String {
        switch self {
        case .signin:
            return "/tokens"

        case .signup:
            return ""

        case .existsByNameAndEmployeeNumber:
            return "/verification-employee"

        case .fetchMyProfile:
            return "/information"

        case .changePassword:
            return "/password"

        case .changeNickname:
            return "/nickname"

        case .changeEmail:
            return "/email"

        case .changeProfileImage:
            return "/profile-image"

        case .changeSpot:
            return "/spot"
        }
    }

    var method: Moya.Method {
        switch self {
        case .fetchMyProfile:
            return .get

        case .existsByNameAndEmployeeNumber:
            return .head

        case .signin, .signup:
            return .post

        case .changePassword, .changeNickname, .changeEmail, .changeProfileImage, .changeSpot:
            return .put
        }
    }

    var task: Moya.Task {
        switch self {
        case let .signin(req):
            return .requestJSONEncodable(req)

        case let .signup(req):
            return .requestJSONEncodable(req)

        case let .existsByNameAndEmployeeNumber(name, employeeNumber):
            return .requestParameters(parameters: [
                "name": name,
                "employee_number": employeeNumber
            ], encoding: URLEncoding.queryString)

        case let .changePassword(req):
            return .requestJSONEncodable(req)

        case let .changeNickname(nickname):
            return .requestParameters(parameters: [
                "nickname": nickname
            ], encoding: JSONEncoding.default)

        case let .changeEmail(email):
            return .requestParameters(parameters: [
                "email": email
            ], encoding: JSONEncoding.default)

        case let .changeProfileImage(imageURL):
            return .requestParameters(parameters: [
                "profile_image_path": imageURL
            ], encoding: JSONEncoding.default)

        case let .changeSpot(spotID):
            return .requestParameters(parameters: [
                "spot_id": spotID
            ], encoding: JSONEncoding.default)

        default:
            return .requestPlain
        }
    }

    var jwtTokenType: JwtTokenType {
        switch self {
        case .fetchMyProfile, .changePassword, .changeNickname, .changeEmail, .changeProfileImage:
            return .accessToken

        default:
            return .none
        }
    }

    var errorMap: [Int: ErrorModule.STError] {
        switch self {
        case .signin:
            return [
                400: .unknown(),
                401: .passwordMismatch,
                404: .notFoundUserBySignin
            ]

        case .signup:
            return [
                400: .unknown(),
                401: .emailIsNotAuthorized,
                409: .userInfoIsAlreadyExistBySignup
            ]

        case .existsByNameAndEmployeeNumber:
            return [
                400: .unknown(),
                401: .notExistsUserByVerifyEmployee
            ]

        case .fetchMyProfile:
            return [
                400: .unknown(),
                401: .accessTokenExpired
            ]

        case .changePassword:
            return [
                400: .unknown(),
                401: .passwordMismatchByChangePassword
            ]

        case .changeNickname:
            return [
                400: .unknown(),
                401: .accessTokenExpired,
                409: .alreadyExistNicknameByChangeNickname
            ]

        case .changeEmail:
            return [
                400: .unknown(),
                401: .accessTokenExpired,
                409: .alreadyExistEmailByChangeEmail
            ]

        case .changeProfileImage:
            return [
                400: .unknown(),
                401: .accessTokenExpired
            ]

        case .changeSpot:
            return [
                400: .unknown(),
                401: .accessTokenExpired
            ]
        }
    }
}
