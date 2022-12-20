import Combine
import BaseFeature
import DesignSystem
import SwiftUI

public final class IntroViewModel: BaseViewModel {
    @Published var isNavigateSignin = false
    @Published var isNavigateSignup = false

    public override init() {
        super.init()
    }
}
