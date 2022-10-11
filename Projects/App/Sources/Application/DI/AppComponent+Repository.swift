import NeedleFoundation
import DomainModule
import DataModule

// MARK: - Common
extension AppComponent {
    public var commonRepository: any CommonsRepository {
        CommonRepositoryImpl(commonRemoteDataSource: commonRemoteDataSource)
    }
}
