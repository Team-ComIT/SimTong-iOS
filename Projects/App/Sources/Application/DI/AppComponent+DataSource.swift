import NeedleFoundation
import NetworkModule

// MARK: - Common
extension AppComponent {
    public var commonsRemoteDataSource: any RemoteCommonsDataSource {
        shared {
            RemoteCommonsDataSourceImpl(keychain: keychain)
        }
    }
}
