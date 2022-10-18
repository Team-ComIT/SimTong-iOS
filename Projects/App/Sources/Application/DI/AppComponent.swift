import NeedleFoundation
import SwiftUI
import RootFeature
import IntroFeature
import FindTabFeature
import FindEmployeeIDFeature
import SignupFeature
import KeychainModule

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

    var signupComponent: SignupComponent {
        SignupComponent(parent: self)
    }

    var findAuthInfoComponent: FindAuthInfoTabComponent {
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
}
