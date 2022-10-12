import NeedleFoundation
import NetworkModule

// MARK: - Commons
extension AppComponent {
    public var remoteCommonsDataSource: any RemoteCommonsDataSource {
        shared {
            RemoteCommonsDataSourceImpl(keychain: keychain)
        }
    }
}

// MARK: - Files
extension AppComponent {
    public var remoteFilesDataSource: any RemoteFilesDataSource {
        shared {
            RemoteFilesDataSourceImpl(keychain: keychain)
        }
    }
}
