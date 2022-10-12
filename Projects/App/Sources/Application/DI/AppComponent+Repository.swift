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

// MARK: - Users
extension AppComponent {
    public var usersRepository: any UsersRepository {
        UsersRepositoryImpl(remoteUsersDataSource: remoteUsersDataSource)
    }
}

// MARK: - Emails
extension AppComponent {
    public var emailsRepository: any EmailsRepository {
        EmailsRepositoryImpl(remoteEmailsDataSource: remoteEmailsDataSource)
    }
}

// MARK: - Menu
extension AppComponent {
    public var menuRepository: any MenuRepository {
        MenuRepositoryImpl(remoteMenuDataSource: remoteMenuDataSource)
    }
}
