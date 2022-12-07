import Combine
import BaseFeature
import DomainModule

public final class EmployeeIDSpotListViewModel: BaseViewModel {
    private let fetchSpotListUseCase: any FetchSpotListUseCase

    @Published var spotList: [SpotEntity] = []
    @Published var selectedSpot: SpotEntity?
    private let completion: (SpotEntity) -> Void

    public init(
        fetchSpotListUseCase: any FetchSpotListUseCase,
        selectedSpot: SpotEntity?,
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
        selectedSpot = spot
        completion(spot)
    }
}
