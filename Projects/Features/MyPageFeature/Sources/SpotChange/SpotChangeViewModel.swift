import Combine
import BaseFeature
import DomainModule

final class SpotChangeViewModel: BaseViewModel {
    private let fetchSpotListUseCase: any FetchSpotListUseCase
    private let changeSpotUseCase: any ChangeSpotUseCase
    @Published var spotList: [SpotEntity] = []
    @Published var saveButtonDisable = false
    @Published var selectedSpot: SpotEntity?
    @Published var limitSpotChange = false
    private let selectedSpotName: String
    private let completion: (SpotEntity) -> Void

    init(
        fetchSpotListUseCase: any FetchSpotListUseCase,
        changeSpotUseCase: any ChangeSpotUseCase,
        selectedSpot: String,
        completion: @escaping (SpotEntity) -> Void
    ) {
        self.fetchSpotListUseCase = fetchSpotListUseCase
        self.changeSpotUseCase = changeSpotUseCase
        self.selectedSpotName = selectedSpot
        self.completion = completion
        super.init()
    }

    @MainActor
    func onAppear() async {
        await withAsyncTry(with: self) { owner in
            let spotList = try await owner.fetchSpotListUseCase.execute()
            owner.spotList = spotList
            owner.selectedSpot = spotList.first { $0.name == owner.selectedSpotName }
        }
    }

    @MainActor
    func spotDidTap(spot: SpotEntity) {
        selectedSpot = spot
        saveButtonDisable = selectedSpot?.name != selectedSpotName
    }

    @MainActor
    func changeSpot() async {
        await withAsyncTry(with: self) { owner in
            guard let spot = owner.selectedSpot else { return }
            try await owner.changeSpotUseCase.execute(spotID: spot.id)
            owner.completion(spot)
        } errorAction: { owner, error in
            if error == .tooManyChangeSpot {
                owner.limitSpotChange = true
            }
        }
    }
}
