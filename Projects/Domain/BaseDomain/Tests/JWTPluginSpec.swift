import BaseDomain
import ComposableArchitecture
import Foundation
import Nimble
import Moya
import Quick
import KeychainModule

extension Keychain: TestDependencyKey {}

final class JWTPluginSpec: QuickSpec {
    override func spec() {
        var plugin: JWTPlugin!
        var request: URLRequest!

        beforeEach {
            plugin = withDependencies {
                $0.keychain = .testValue
            } operation: {
                JWTPlugin()
            }
            request = URLRequest(url: TestAPI.none.baseURL)
        }

        describe("prepare") {
            context("when the target is JwtAuthorizable and the token type is .none") {
                it("does not add a JWT token to the request") {
                    let target = TestAPI.none
                    let preparedRequest = plugin.prepare(request, target: target)

                    expect { preparedRequest.value(forHTTPHeaderField: JwtTokenType.accessToken.rawValue) }
                        .to(beNil())
                    expect { preparedRequest.value(forHTTPHeaderField: JwtTokenType.refreshToken.rawValue) }
                        .to(beNil())
                }
            }

            context("when the target is JwtAuthorizable and the token type is accessToken") {
                it("adds an access token to the request's '\(JwtTokenType.accessToken.rawValue)' header") {
                    let target = TestAPI.access
                    let preparedRequest = plugin.prepare(request, target: target)

                    expect { preparedRequest.value(forHTTPHeaderField: JwtTokenType.accessToken.rawValue) }
                        .to(equal("Bearer token"))
                    expect { preparedRequest.value(forHTTPHeaderField: JwtTokenType.refreshToken.rawValue) }
                        .to(beNil())
                }
            }

            context("when the target is JwtAuthorizable and the token type is refreshToken") {
                it("adds a refresh token to the request's '\(JwtTokenType.refreshToken.rawValue)' header") {
                    let target = TestAPI.refresh
                    let preparedRequest = plugin.prepare(request, target: target)

                    expect { preparedRequest.value(forHTTPHeaderField: JwtTokenType.accessToken.rawValue) }
                        .to(beNil())
                    expect { preparedRequest.value(forHTTPHeaderField: JwtTokenType.refreshToken.rawValue) }
                        .to(equal("token"))
                }
            }
        }
    }
}
