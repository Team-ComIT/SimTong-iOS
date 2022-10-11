import Combine
import BaseFeature
import DomainModule

public final class FindEmployeeIDViewModel: BaseViewModel {
    @Published var name = ""
    @Published var email = ""
    @Published var spot = ""
    @Published var selectedSpot: Spot?
    var isFormValid: Bool {
        !name.isEmpty && !email.isEmpty && selectedSpot != nil
    }
}
