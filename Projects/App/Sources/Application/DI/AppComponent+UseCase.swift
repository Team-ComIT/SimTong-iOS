import NeedleFoundation
import DomainModule
import DataModule

// MARK: - Commons
extension AppComponent {
    public var fetchSpotListUseCase: any FetchSpotListUseCase {
        FetchSpotListUseCaseStub()
    }

    public var findEmployeeNumberUseCase: any FindEmployeeNumberUseCase {
        FindEmployeeNumberUseCaseImpl(commonRepository: commonsRepository)
    }
}

// MARK: - Files
extension AppComponent {
    public var uploadSingleFileUseCase: any UploadSingleFileUseCase {
        UploadSingleFileUseCaseImpl(filesRepository: filesRepository)
    }

    public var uploadMultipleFileUseCase: any UploadMultipleFileUseCase {
        UploadMultipleFileUseCaseImpl(filesRepository: filesRepository)
    }
}

// MARK: - Users
extension AppComponent {
    public var signinUseCase: any SigninUseCase {
        SigninUseCaseImpl(usersRepository: usersRepository)
    }

    public var signupUseCase: any SignupUseCase {
        SignupUseCaseImpl(usersRepository: usersRepository)
    }

    public var existsByNameAndEmployeeNumberUseCase: any ExistsByNameAndEmployeeNumberUseCase {
        ExistsByNameAndEmployeeNumberUseCaseImpl(usersRepository: usersRepository)
    }

    public var existsByEmailUseCase: any ExistsByEmailUseCase {
        ExistsByEmailUseCaseImpl(usersRepository: usersRepository)
    }

    public var fetchMyProfileUseCase: any FetchMyProfileUseCase {
        FetchMyProfileUseCaseImpl(usersRepository: usersRepository)
    }

    public var changePasswordUseCase: any ChangePasswordUseCase {
        ChangePasswordUseCaseImpl(usersRepository: usersRepository)
    }

    public var changeNicknameUseCase: any ChangeNicknameUseCase {
        ChangeNicknameUseCaseImpl(usersRepository: usersRepository)
    }

    public var changeEmailUseCase: any ChangeEmailUseCase {
        ChangeEmailUseCaseImpl(usersRepository: usersRepository)
    }

    public var changeProfileImageUseCase: any ChangeProfileImageUseCase {
        ChangeProfileImageUseCaseImpl(usersRepository: usersRepository)
    }

    public var changeSpotUseCase: any ChangeSpotUseCase {
        ChangeSpotUseCaseImpl(usersRepository: usersRepository)
    }
}

// MARK: - Emails
extension AppComponent {
    public var verifyAuthCodeUseCase: any VerifyAuthCodeUseCase {
        VerifyAuthCodeUseCaseImpl(emailsRepository: emailsRepository)
    }

    public var sendAuthCodeUseCase: any SendAuthCodeUseCase {
        SendAuthCodeUseCaseImpl(emailsRepository: emailsRepository)
    }
}

// MARK: - Menu
extension AppComponent {
    public var fetchMenuListUseCase: any FetchMenuListUseCase {
        FetchMenuListUseCaseImpl(menuRepository: menuRepository)
    }

    public var fetchPublicMenuListUseCase: any FetchPublicMenuListUseCase {
        FetchPublicMenuListUseCaseImpl(menuRepository: menuRepository)
    }
}
