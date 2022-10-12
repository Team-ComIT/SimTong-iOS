import NeedleFoundation
import DomainModule
import DataModule

// MARK: - Commons
extension AppComponent {
    public var commonsRepository: any CommonsRepository {
        CommonsRepositoryImpl(remoteCommonsDataSource: remoteCommonsDataSource)
    }
}

// MARK: - Files
extension AppComponent {
    public var filesRepository: any FilesRepository {
        FilesRepositoryImpl(remoteFilesDataSource: remoteFilesDataSource)
    }
}
