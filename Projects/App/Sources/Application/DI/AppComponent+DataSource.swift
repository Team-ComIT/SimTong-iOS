import NeedleFoundation
import NetworkModule

// MARK: - Commons
extension AppComponent {
    public var remoteCommonsDataSource: any RemoteCommonsDataSource {
        shared {
//            RemoteCommonsDataSourceMock() // TODO: 나중에 변경
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

// MARK: - Users
extension AppComponent {
    public var remoteUsersDataSource: any RemoteUsersDataSource {
        shared {
//            RemoteUsersDataSourceMock() // TODO: 나중에 변경
            RemoteUsersDataSourceImpl(keychain: keychain)
        }
    }
}

// MARK: - Emails
extension AppComponent {
    public var remoteEmailsDataSource: any RemoteEmailsDataSource {
        shared {
//            RemoteEmailsDataSourceMock() // TODO: 나중에 변경
            RemoteEmailsDataSourceImpl(keychain: keychain)
        }
    }
}

// MARK: - Menu
extension AppComponent {
    public var remoteMenuDataSource: any RemoteMenuDataSource {
        shared {
            RemoteMenuDataSourceImpl(keychain: keychain)
        }
    }
}

// MARK: - Schedule
extension AppComponent {
    public var remoteScheduleDataSource: any RemoteScheduleDataSource {
        shared {
            RemoteScheduleDataSourceImpl(keychain: keychain)
        }
    }
}
