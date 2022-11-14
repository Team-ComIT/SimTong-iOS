import NeedleFoundation
import SwiftUI
import RootFeature
import IntroFeature
import FindTabFeature
import FindEmployeeIDFeature
import SignupFeature
import KeychainModule
import FindPasswordFeature
import MainTabFeature
import MyPageFeature
import SigninFeature

final class AppComponent: BootstrapComponent {
    func makeRootView() -> some View {
        rootComponent.makeView()
    }

    var rootComponent: RootComponent {
        RootComponent(parent: self)
    }

    var keychain: any Keychain {
        shared {
            DefaultKeychain()
        }
    }
}

// MARK: - Auth
extension AppComponent {
    var introComponent: IntroComponent {
        IntroComponent(parent: self)
    }

    var signupEmployeeInfoComponent: SignupEmployeeInfoComponent {
        SignupEmployeeInfoComponent(parent: self)
    }

    var signupVerifyComponent: SignupVerifyComponent {
        SignupVerifyComponent(parent: self)
    }

    var signupPasswordComponent: SignupPasswordComponent {
        SignupPasswordComponent(parent: self)
    }

    var signupInfoComponent: SignupInfoComponent {
        SignupInfoComponent(parent: self)
    }

    var signinComponent: SigninComponent {
        SigninComponent(parent: self)
    }

    var findAuthInfoTabComponent: FindAuthInfoTabComponent {
        FindAuthInfoTabComponent(parent: self)
    }

    var findEmployeeIDComponent: FindEmployeeIDComponent {
        FindEmployeeIDComponent(parent: self)
    }

    var employeeIDSpotListComponent: EmployeeIDSpotListComponent {
        EmployeeIDSpotListComponent(parent: self)
    }

    var employeeIDResultComponent: EmployeeIDResultComponent {
        EmployeeIDResultComponent(parent: self)
    }

    var findPasswordInfoComponent: FindPasswordInfoComponent {
        FindPasswordInfoComponent(parent: self)
    }

    var renewalPasswordComponent: RenewalPasswordComponent {
        RenewalPasswordComponent(parent: self)
    }

    var findPasswordVerifyComponent: FindPasswordVerifyComponent {
        FindPasswordVerifyComponent(parent: self)
    }

    var nicknameModifyComponent: NicknameModifyComponent {
        NicknameModifyComponent(parent: self)
    }
}

// MARK: - Main
extension AppComponent {
    var mainTabComponent: MainTabComponent {
        MainTabComponent(parent: self)
    }

    var myPageComponent: MyPageComponent {
        MyPageComponent(parent: self)
    }
}
