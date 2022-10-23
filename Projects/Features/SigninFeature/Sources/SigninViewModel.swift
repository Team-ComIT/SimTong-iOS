import Combine
import BaseFeature

final class SigninViewModel: BaseViewModel {
    @Published var employeeID = ""
    @Published var password = ""
}
