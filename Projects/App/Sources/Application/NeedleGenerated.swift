

import BaseFeature
import DataModule
import DomainModule
import FindEmployeeIDFeature
import FindPasswordFeature
import FindTabFeature
import IntroFeature
import KeychainModule
import NeedleFoundation
import NetworkModule
import RootFeature
import SignupFeature
import SwiftUI

// swiftlint:disable unused_declaration
private let needleDependenciesHash : String? = nil

// MARK: - Traversal Helpers

private func parent1(_ component: NeedleFoundation.Scope) -> NeedleFoundation.Scope {
    return component.parent
}

// MARK: - Providers

#if !NEEDLE_DYNAMIC

private class SignupDependency1ff7d1355204bb65e850Provider: SignupDependency {


    init() {

    }
}
/// ^->AppComponent->SignupComponent
private func factory86602ff0d0dbaf2cb017e3b0c44298fc1c149afb(_ component: NeedleFoundation.Scope) -> AnyObject {
    return SignupDependency1ff7d1355204bb65e850Provider()
}
private class EmployeeIDResultDependency17ee22cd492649466e5fProvider: EmployeeIDResultDependency {


    init() {

    }
}
/// ^->AppComponent->EmployeeIDResultComponent
private func factory7e57080bfb497fcb08dbe3b0c44298fc1c149afb(_ component: NeedleFoundation.Scope) -> AnyObject {
    return EmployeeIDResultDependency17ee22cd492649466e5fProvider()
}
private class FindEmployeeDependency636344242d29e7292bd9Provider: FindEmployeeDependency {
    var employeeIDSpotListComponent: EmployeeIDSpotListComponent {
        return appComponent.employeeIDSpotListComponent
    }
    var employeeIDResultComponent: EmployeeIDResultComponent {
        return appComponent.employeeIDResultComponent
    }
    private let appComponent: AppComponent
    init(appComponent: AppComponent) {
        self.appComponent = appComponent
    }
}
/// ^->AppComponent->FindEmployeeIDComponent
private func factoryfbe97e441ca213085fa6f47b58f8f304c97af4d5(_ component: NeedleFoundation.Scope) -> AnyObject {
    return FindEmployeeDependency636344242d29e7292bd9Provider(appComponent: parent1(component) as! AppComponent)
}
private class EmployeeIDSpotListDependency9ec4920d77848b463dd3Provider: EmployeeIDSpotListDependency {
    var fetchSpotListUseCase: any FetchSpotListUseCase {
        return appComponent.fetchSpotListUseCase
    }
    private let appComponent: AppComponent
    init(appComponent: AppComponent) {
        self.appComponent = appComponent
    }
}
/// ^->AppComponent->EmployeeIDSpotListComponent
private func factory529868f8afc90f854ddcf47b58f8f304c97af4d5(_ component: NeedleFoundation.Scope) -> AnyObject {
    return EmployeeIDSpotListDependency9ec4920d77848b463dd3Provider(appComponent: parent1(component) as! AppComponent)
}
private class RootDependency3944cc797a4a88956fb5Provider: RootDependency {


    init() {

    }
}
/// ^->AppComponent->RootComponent
private func factory264bfc4d4cb6b0629b40e3b0c44298fc1c149afb(_ component: NeedleFoundation.Scope) -> AnyObject {
    return RootDependency3944cc797a4a88956fb5Provider()
}
private class RenewalPasswordDependencya722dc02d5f3ad3403cfProvider: RenewalPasswordDependency {
    var resetPasswordUseCase: any ResetPasswordUseCase {
        return appComponent.resetPasswordUseCase
    }
    private let appComponent: AppComponent
    init(appComponent: AppComponent) {
        self.appComponent = appComponent
    }
}
/// ^->AppComponent->RenewalPasswordComponent
private func factory236a429a80d834e1f370f47b58f8f304c97af4d5(_ component: NeedleFoundation.Scope) -> AnyObject {
    return RenewalPasswordDependencya722dc02d5f3ad3403cfProvider(appComponent: parent1(component) as! AppComponent)
}
private class FindPasswordInfoDependency2ddef0504ff382f9d508Provider: FindPasswordInfoDependency {
    var renewalPasswordComponent: RenewalPasswordComponent {
        return appComponent.renewalPasswordComponent
    }
    private let appComponent: AppComponent
    init(appComponent: AppComponent) {
        self.appComponent = appComponent
    }
}
/// ^->AppComponent->FindPasswordInfoComponent
private func factory508fc8f893455de876c5f47b58f8f304c97af4d5(_ component: NeedleFoundation.Scope) -> AnyObject {
    return FindPasswordInfoDependency2ddef0504ff382f9d508Provider(appComponent: parent1(component) as! AppComponent)
}
private class FindAuthInfoTabDependency79082cf44b62999fcee0Provider: FindAuthInfoTabDependency {
    var findEmployeeIDComponent: FindEmployeeIDComponent {
        return appComponent.findEmployeeIDComponent
    }
    var findPasswordInfoComponent: FindPasswordInfoComponent {
        return appComponent.findPasswordInfoComponent
    }
    private let appComponent: AppComponent
    init(appComponent: AppComponent) {
        self.appComponent = appComponent
    }
}
/// ^->AppComponent->FindAuthInfoTabComponent
private func factory9e86e7b14b904564e8d9f47b58f8f304c97af4d5(_ component: NeedleFoundation.Scope) -> AnyObject {
    return FindAuthInfoTabDependency79082cf44b62999fcee0Provider(appComponent: parent1(component) as! AppComponent)
}
private class IntroDependencye04a89d39c733d937499Provider: IntroDependency {


    init() {

    }
}
/// ^->AppComponent->IntroComponent
private func factoryaf0e1f54bae4c77ad4ace3b0c44298fc1c149afb(_ component: NeedleFoundation.Scope) -> AnyObject {
    return IntroDependencye04a89d39c733d937499Provider()
}

#else
extension AppComponent: Registration {
    public func registerItems() {

        localTable["remoteCommonsDataSource-any RemoteCommonsDataSource"] = { self.remoteCommonsDataSource as Any }
        localTable["remoteFilesDataSource-any RemoteFilesDataSource"] = { self.remoteFilesDataSource as Any }
        localTable["remoteUsersDataSource-any RemoteUsersDataSource"] = { self.remoteUsersDataSource as Any }
        localTable["remoteEmailsDataSource-any RemoteEmailsDataSource"] = { self.remoteEmailsDataSource as Any }
        localTable["remoteMenuDataSource-any RemoteMenuDataSource"] = { self.remoteMenuDataSource as Any }
        localTable["commonsRepository-any CommonsRepository"] = { self.commonsRepository as Any }
        localTable["filesRepository-any FilesRepository"] = { self.filesRepository as Any }
        localTable["usersRepository-any UsersRepository"] = { self.usersRepository as Any }
        localTable["emailsRepository-any EmailsRepository"] = { self.emailsRepository as Any }
        localTable["menuRepository-any MenuRepository"] = { self.menuRepository as Any }
        localTable["fetchSpotListUseCase-any FetchSpotListUseCase"] = { self.fetchSpotListUseCase as Any }
        localTable["findEmployeeNumberUseCase-any FindEmployeeNumberUseCase"] = { self.findEmployeeNumberUseCase as Any }
        localTable["resetPasswordUseCase-any ResetPasswordUseCase"] = { self.resetPasswordUseCase as Any }
        localTable["changePasswordUseCase-any ChangePasswordUseCase"] = { self.changePasswordUseCase as Any }
        localTable["uploadSingleFileUseCase-any UploadSingleFileUseCase"] = { self.uploadSingleFileUseCase as Any }
        localTable["uploadMultipleFileUseCase-any UploadMultipleFileUseCase"] = { self.uploadMultipleFileUseCase as Any }
        localTable["signinUseCase-any SigninUseCase"] = { self.signinUseCase as Any }
        localTable["signupUseCase-any SignupUseCase"] = { self.signupUseCase as Any }
        localTable["existsByNameAndEmployeeNumberUseCase-any ExistsByNameAndEmployeeNumberUseCase"] = { self.existsByNameAndEmployeeNumberUseCase as Any }
        localTable["checkDuplicateEmail-any CheckDuplicateEmailUseCase"] = { self.checkDuplicateEmail as Any }
        localTable["fetchMyProfileUseCase-any FetchMyProfileUseCase"] = { self.fetchMyProfileUseCase as Any }
        localTable["changeNicknameUseCase-any ChangeNicknameUseCase"] = { self.changeNicknameUseCase as Any }
        localTable["changeEmailUseCase-any ChangeEmailUseCase"] = { self.changeEmailUseCase as Any }
        localTable["changeProfileImageUseCase-any ChangeProfileImageUseCase"] = { self.changeProfileImageUseCase as Any }
        localTable["changeSpotUseCase-any ChangeSpotUseCase"] = { self.changeSpotUseCase as Any }
        localTable["checkDuplicateNicknameUseCase-any CheckDuplicateNicknameUseCase"] = { self.checkDuplicateNicknameUseCase as Any }
        localTable["verifyAuthCodeUseCase-any VerifyAuthCodeUseCase"] = { self.verifyAuthCodeUseCase as Any }
        localTable["sendAuthCodeUseCase-any SendAuthCodeUseCase"] = { self.sendAuthCodeUseCase as Any }
        localTable["fetchMenuListUseCase-any FetchMenuListUseCase"] = { self.fetchMenuListUseCase as Any }
        localTable["fetchPublicMenuListUseCase-any FetchPublicMenuListUseCase"] = { self.fetchPublicMenuListUseCase as Any }
    }
}
extension SignupComponent: Registration {
    public func registerItems() {

    }
}
extension EmployeeIDResultComponent: Registration {
    public func registerItems() {

    }
}
extension FindEmployeeIDComponent: Registration {
    public func registerItems() {
        keyPathToName[\FindEmployeeDependency.employeeIDSpotListComponent] = "employeeIDSpotListComponent-EmployeeIDSpotListComponent"
        keyPathToName[\FindEmployeeDependency.employeeIDResultComponent] = "employeeIDResultComponent-EmployeeIDResultComponent"
    }
}
extension EmployeeIDSpotListComponent: Registration {
    public func registerItems() {
        keyPathToName[\EmployeeIDSpotListDependency.fetchSpotListUseCase] = "fetchSpotListUseCase-any FetchSpotListUseCase"
    }
}
extension RootComponent: Registration {
    public func registerItems() {

    }
}
extension RenewalPasswordComponent: Registration {
    public func registerItems() {
        keyPathToName[\RenewalPasswordDependency.resetPasswordUseCase] = "resetPasswordUseCase-any ResetPasswordUseCase"
    }
}
extension FindPasswordInfoComponent: Registration {
    public func registerItems() {
        keyPathToName[\FindPasswordInfoDependency.renewalPasswordComponent] = "renewalPasswordComponent-RenewalPasswordComponent"
    }
}
extension FindAuthInfoTabComponent: Registration {
    public func registerItems() {
        keyPathToName[\FindAuthInfoTabDependency.findEmployeeIDComponent] = "findEmployeeIDComponent-FindEmployeeIDComponent"
        keyPathToName[\FindAuthInfoTabDependency.findPasswordInfoComponent] = "findPasswordInfoComponent-FindPasswordInfoComponent"
    }
}
extension IntroComponent: Registration {
    public func registerItems() {

    }
}


#endif

private func factoryEmptyDependencyProvider(_ component: NeedleFoundation.Scope) -> AnyObject {
    return EmptyDependencyProvider(component: component)
}

// MARK: - Registration
private func registerProviderFactory(_ componentPath: String, _ factory: @escaping (NeedleFoundation.Scope) -> AnyObject) {
    __DependencyProviderRegistry.instance.registerDependencyProviderFactory(for: componentPath, factory)
}

#if !NEEDLE_DYNAMIC

private func register1() {
    registerProviderFactory("^->AppComponent", factoryEmptyDependencyProvider)
    registerProviderFactory("^->AppComponent->SignupComponent", factory86602ff0d0dbaf2cb017e3b0c44298fc1c149afb)
    registerProviderFactory("^->AppComponent->EmployeeIDResultComponent", factory7e57080bfb497fcb08dbe3b0c44298fc1c149afb)
    registerProviderFactory("^->AppComponent->FindEmployeeIDComponent", factoryfbe97e441ca213085fa6f47b58f8f304c97af4d5)
    registerProviderFactory("^->AppComponent->EmployeeIDSpotListComponent", factory529868f8afc90f854ddcf47b58f8f304c97af4d5)
    registerProviderFactory("^->AppComponent->RootComponent", factory264bfc4d4cb6b0629b40e3b0c44298fc1c149afb)
    registerProviderFactory("^->AppComponent->RenewalPasswordComponent", factory236a429a80d834e1f370f47b58f8f304c97af4d5)
    registerProviderFactory("^->AppComponent->FindPasswordInfoComponent", factory508fc8f893455de876c5f47b58f8f304c97af4d5)
    registerProviderFactory("^->AppComponent->FindAuthInfoTabComponent", factory9e86e7b14b904564e8d9f47b58f8f304c97af4d5)
    registerProviderFactory("^->AppComponent->IntroComponent", factoryaf0e1f54bae4c77ad4ace3b0c44298fc1c149afb)
}
#endif

public func registerProviderFactories() {
#if !NEEDLE_DYNAMIC
    register1()
#endif
}
