import NeedleFoundation
import DomainModule
import DataModule

// MARK: - Common
extension AppComponent {
    public var commonsRepository: any CommonsRepository {
        CommonsRepositoryImpl(remoteCommonsDataSource: commonsRemoteDataSource)
    }
}
