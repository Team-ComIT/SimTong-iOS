import XCTest
@testable import FindAuthInfoFeature
import DomainModule
import DataModule
import Nimble

final class EmployeeIDSpotListViewModelTests: XCTestCase {
    var fetchSpotListUseCase: FetchSpotListUseCase!
    var viewModel: EmployeeIDSpotListViewModel!
    var selectedSpot: Spot?

    override func setUp() {
        fetchSpotListUseCase = FetchSpotListUseCaseStub()
        viewModel = EmployeeIDSpotListViewModel(
            fetchSpotListUseCase: fetchSpotListUseCase,
            selectedSpot: selectedSpot,
            completion: { spot in
                self.selectedSpot = spot
            }
        )
    }

    override func tearDown() {
        viewModel = nil
        fetchSpotListUseCase = nil
    }

    func test_viewModel의_onAppear가_실행되면_spotList를_fetch해온다() async {
        await viewModel.onAppear()
        expect { self.viewModel.spotList.count }.toNot(equal(0))
        expect { self.viewModel.spotList.count }.to(equal(4))
    }

    func test_viewModel에서_spotDidTap이_실행되면_selectedSpot도_바뀐다() {
        let spot = Spot(
            id: "id",
            name: "spot",
            location: "location"
        )
        viewModel.spotDidTap(spot: spot)

        expect { self.viewModel.selectedSpot }.toNot(beNil())
        expect { self.viewModel.selectedSpot }.to(equal(selectedSpot))

        expect { self.viewModel.selectedSpot!.id }.to(equal("id"))
        expect { self.viewModel.selectedSpot!.name }.to(equal("spot"))
        expect { self.viewModel.selectedSpot!.location }.to(equal("location"))

        expect { self.selectedSpot!.id }.to(equal("id"))
        expect { self.selectedSpot!.name }.to(equal("spot"))
        expect { self.selectedSpot!.location }.to(equal("location"))
    }
}
