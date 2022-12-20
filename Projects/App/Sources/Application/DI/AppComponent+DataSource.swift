import NeedleFoundation
import NetworkModule
import DatabaseModule

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

// MARK: - Users
extension AppComponent {
    public var remoteUsersDataSource: any RemoteUsersDataSource {
        shared {
            RemoteUsersDataSourceImpl(keychain: keychain)
        }
    }
    public var localUsersDataSource: any LocalUsersDataSource {
        shared {
            LocalUsersDataSourceImpl(keychain: keychain)
        }
    }
}

// MARK: - Emails
extension AppComponent {
    public var remoteEmailsDataSource: any RemoteEmailsDataSource {
        shared {
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

// MARK: - Holidays
extension AppComponent {
    public var remoteHolidaysDataSource: any RemoteHolidaysDataSource {
        RemoteHolidaysDataSourceImpl(keychain: keychain)
    }
}
