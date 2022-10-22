import Combine
import BaseFeature
import DomainModule

public final class FindEmployeeIDViewModel: BaseViewModel {
    @Published var name = ""
    @Published var email = ""
    @Published var spot = ""
    @Published var selectedSpot: SpotEntity?
    @Published var isNavigateResultID = false

    var isFormValid: Bool {
        !name.isEmpty && !email.isEmpty && selectedSpot != nil
    }
    var resultID: String = ""

    @MainActor
    func findID() {
        Task {
            resultID = "20050311"
            isNavigateResultID = true
        }
    }
}
