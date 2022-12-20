import NeedleFoundation
import DomainModule
import DataModule
import DatabaseModule

// MARK: - Commons
extension AppComponent {
    public var fetchSpotListUseCase: any FetchSpotListUseCase {
        FetchSpotListUseCaseImpl(commonRepository: commonsRepository)
    }

    public var findEmployeeNumberUseCase: any FindEmployeeNumberUseCase {
        FindEmployeeNumberUseCaseImpl(commonRepository: commonsRepository)
    }

    public var comparePasswordUseCase: any ComparePasswordUseCase {
        ComparePasswordUseCaseImpl(commonsRepository: commonsRepository)
    }

    public var reissueTokenUseCase: any ReissueTokenUseCase {
        ReissueTokenUseCaseImpl(commonsRepository: commonsRepository)
    }

    public var resetPasswordUseCase: any ResetPasswordUseCase {
        ResetPasswordUseCaseImpl(commonsRepository: commonsRepository)
    }

    public var changePasswordUseCase: any ChangePasswordUseCase {
        ChangePasswordUseCaseImpl(commonsRepository: commonsRepository)
    }

    public var checkExistEmployeeIDAndEmailUseCase: any CheckExistEmployeeIDAndEmailUseCase {
        CheckExistEmployeeIDAndEmailUseCaseImpl(commonsRepository: commonsRepository)
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

    public var logoutUseCase: any LogoutUseCase {
        LogoutUseCaseImpl(usersRepository: usersRepository)
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

// MARK: - Scheduls
extension AppComponent {
    public var fetchScheduleUseCase: any FetchScheduleUseCase {
        FetchScheduleUseCaseImpl(scheduleRepository: scheduleRepository)
    }

    public var createNewScheduleUseCase: any CreateNewScheduleUseCase {
        CreateNewScheduleUseCaseImpl(scheduleRepository: scheduleRepository)
    }

    public var updateScheduleUseCase: any UpdateScheduleUseCase {
        UpdateScheduleUseCaseImpl(scheduleRepository: scheduleRepository)
    }

    public var deleteScheduleUseCase: any DeleteScheduleUseCase {
        DeleteScheduleUseCaseImpl(scheduleRepository: scheduleRepository)
    }
}

// MARK: - Holidays
extension AppComponent {
    public var fetchHolidayUseCase: any FetchHolidayUseCase {
        FetchHolidayUseCaseImpl(holidaysRepository: holidaysRepository)
    }

    public var setHolidayUseCase: any SetHolidayUseCase {
        SetHolidayUseCaseImpl(holidaysRepository: holidaysRepository)
    }

    public var setAnnualUseCase: any SetAnnualUseCase {
        SetAnnualUseCaseImpl(holidaysRepository: holidaysRepository)
    }

    public var setWorkUseCase: any SetWorkUseCase {
        SetWorkUseCaseImpl(holidaysRepository: holidaysRepository)
    }

    public var fetchAnnualCountUseCase: any FetchAnnualCountUseCase {
        FetchAnnualCountUseCaseImpl(holidaysRepository: holidaysRepository)
    }
}
