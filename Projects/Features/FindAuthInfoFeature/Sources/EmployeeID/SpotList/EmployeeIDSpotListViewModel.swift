import Combine
import BaseFeature
import DomainModule

public final class EmployeeIDSpotListViewModel: BaseViewModel {
    private let fetchSpotListUseCase: any FetchSpotListUseCase

    @Published var spotList: [Spot] = []
    @Published var selectedSpot: Spot?
    private let completion: (Spot) -> Void

    public init(
        fetchSpotListUseCase: any FetchSpotListUseCase,
        selectedSpot: Spot?,
        completion: @escaping (Spot) -> Void
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

    public func spotDidTap(spot: Spot) {
        selectedSpot = spot
        completion(spot)
    }
}
