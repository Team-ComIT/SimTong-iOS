import Combine
import BaseFeature
import DomainModule

public final class SpotChangeViewModel: BaseViewModel {
    private let fetchSpotListUseCase: any FetchSpotListUseCase

    @Published var spotList: [SpotEntity] = []
    @Published var selectedSpot: String
    private let completion: (SpotEntity) -> Void

    public init(
        fetchSpotListUseCase: any FetchSpotListUseCase,
        selectedSpot: String,
        completion: @escaping (SpotEntity) -> Void
    ) {
        self.fetchSpotListUseCase = fetchSpotListUseCase
        self.selectedSpot = selectedSpot
        self.completion = completion
        super.init()
    }

    @MainActor
    public func onAppear() async {
        await withAsyncTry(with: self) { owner in
            owner.spotList = try await owner.fetchSpotListUseCase.execute()
        }
    }

    public func spotDidTap(spot: SpotEntity) {
        selectedSpot = spot.name
        completion(spot)
    }
}
