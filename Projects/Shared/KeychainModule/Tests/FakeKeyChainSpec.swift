import Quick
import Nimble
import KeychainModuleInterface
import KeychainModuleTesting

final class FakeKeyChainSpec: QuickSpec {
    override func spec() {
        var keychain: FakeKeyChain!

        beforeEach {
            keychain = FakeKeyChain()
        }

        describe("save") {
            it("should save the value in the store") {
                keychain.save(type: .accessToken, value: "abc123")
                expect(keychain.store["ACCESS-TOKEN"]).to(equal("abc123"))
            }
        }

        describe("load") {
            it("should return the saved value") {
                keychain.store["ACCESS-TOKEN"] = "abc123"
                let value = keychain.load(type: .accessToken)
                expect(value).to(equal("abc123"))
            }
        }

        describe("delete") {
            it("should delete the value from the store") {
                keychain.store["ACCESS-TOKEN"] = "abc123"
                keychain.delete(type: .accessToken)
                expect(keychain.store["ACCESS-TOKEN"]).to(beNil())
            }
        }
    }
}
