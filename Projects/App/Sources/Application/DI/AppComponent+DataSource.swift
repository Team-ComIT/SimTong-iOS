import NeedleFoundation
import NetworkModule

// MARK: - Common
extension AppComponent {
    public var commonRemoteDataSource: any RemoteCommonDataSource {
        shared {
            RemoteCommonDataSourceImpl(keychain: keychain)
        }
    }
}
