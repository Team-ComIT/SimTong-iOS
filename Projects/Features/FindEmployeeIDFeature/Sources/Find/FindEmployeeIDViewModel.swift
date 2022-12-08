import Combine
import BaseFeature
import DomainModule
import Foundation

public final class FindEmployeeIDViewModel: BaseViewModel {
    @Published var name = ""
    @Published var email = ""
    @Published var spot = ""
    @Published var selectedSpot: SpotEntity?
    @Published var isNavigateResultID = false
    @Published var isPresentedSpotList = false
    private let findEmployeeNumberUseCase: FindEmployeeNumberUseCase

    init(findEmployeeNumberUseCase: FindEmployeeNumberUseCase) {
        self.findEmployeeNumberUseCase = findEmployeeNumberUseCase
    }

    var isFormValid: Bool {
        !name.isEmpty && !email.isEmpty && selectedSpot != nil
    }
    var resultID: String = ""

    @MainActor
    func findID() {
        Task {
            await withAsyncTry(with: self) { owner in
                let resultID = try await owner.findEmployeeNumberUseCase.execute(req:
                    .init(
                        name: owner.name,
                        spotId: owner.selectedSpot?.id ?? "",
                        email: owner.email
                    )
                )
                owner.resultID = resultID.description
                owner.isNavigateResultID = true
            }
        }
    }
}
