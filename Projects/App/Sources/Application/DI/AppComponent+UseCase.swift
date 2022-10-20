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

    public var resetPasswordUseCase: any ResetPasswordUseCase {
        ResetPasswordUseCaseImpl(commonsRepository: commonsRepository)
    }

    public var changePasswordUseCase: any ChangePasswordUseCase {
        ChangePasswordUseCaseImpl(commonsRepository: commonsRepository)
    }

    public var checkExistNameAndEmailUseCase: any CheckExistNameAndEmailUseCase {
        CheckExistNameAndEmailUseCaseImpl(commonsRepository: commonsRepository)
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

    public var checkExistNameAndEmployeeIDUseCase: any CheckExistNameAndEmployeeIDUseCase {
        CheckExistNameAndEmployeeIDUseCaseImpl(usersRepository: usersRepository)
    }

    public var checkDuplicateEmail: any CheckDuplicateEmailUseCase {
        CheckDuplicateEmailUseCaseImpl(commonsRepository: commonsRepository)
    }

    public var fetchMyProfileUseCase: any FetchMyProfileUseCase {
        FetchMyProfileUseCaseImpl(usersRepository: usersRepository)
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

    public var checkDuplicateNicknameUseCase: any CheckDuplicateNicknameUseCase {
        CheckDuplicateNicknameUseCaseImpl(usersRepository: usersRepository)
    }
}

// MARK: - Emails
extension AppComponent {
    public var verifyAuthCodeUseCase: any VerifyAuthCodeUseCase {
        VerifyAuthCodeUseCaseDummy()
//        VerifyAuthCodeUseCaseImpl(emailsRepository: emailsRepository)
    }

    public var sendAuthCodeUseCase: any SendAuthCodeUseCase {
        SendAuthCodeUseCaseDummy()
//        SendAuthCodeUseCaseImpl(emailsRepository: emailsRepository)
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
