import NeedleFoundation
import DomainModule
import DataModule

// MARK: - Common
extension AppComponent {
    public var fetchSpotListUseCase: any FetchSpotListUseCase {
        FetchSpotListUseCaseStub()
    }
}
