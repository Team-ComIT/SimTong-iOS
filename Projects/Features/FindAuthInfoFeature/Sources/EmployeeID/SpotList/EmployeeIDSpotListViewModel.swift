import Combine
import BaseFeature
import DomainModule

public final class EmployeeIDSpotListViewModel: BaseViewModel {
    private let fetchSpotListUseCase: any FetchSpotListUseCase

    @Published var spotList: [Spot] = []
    @Published var selectedSpot: Spot?

    public init(
        fetchSpotListUseCase: any FetchSpotListUseCase,
        selectedSpot: Spot?
    ) {
        self.fetchSpotListUseCase = fetchSpotListUseCase
        self.selectedSpot = selectedSpot
        super.init()
    }

    @MainActor
    public func onAppear() async {
        await withAsyncTry(with: self) { owner in
            owner.spotList = try await owner.fetchSpotListUseCase.execute()
        }
    }
}
