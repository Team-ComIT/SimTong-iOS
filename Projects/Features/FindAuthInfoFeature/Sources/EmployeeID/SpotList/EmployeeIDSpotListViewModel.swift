import Combine
import BaseFeature
import DomainModule

public final class EmployeeIDSpotListViewModel: BaseViewModel {
    private let fetchSpotListUseCase: any FetchSpotListUseCase

    @Published var spotList: [Spot] = []

    public init(
        fetchSpotListUseCase: any FetchSpotListUseCase
    ) {
        self.fetchSpotListUseCase = fetchSpotListUseCase
        super.init()
    }

    public func onAppear() async throws {
        spotList = try await fetchSpotListUseCase.execute()
    }
}
