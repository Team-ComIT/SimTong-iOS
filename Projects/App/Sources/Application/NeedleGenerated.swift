

import BaseFeature
import DataModule
import DomainModule
import FindEmployeeIDFeature
import FindTabFeature
import IntroFeature
import KeychainModule
import MainTabFeature
import MyPageFeature
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

private class SignupPasswordDependency778bf5389a70d7df6152Provider: SignupPasswordDependency {
    var signupInfoComponent: SignupInfoComponent {
        return appComponent.signupInfoComponent
    }
    private let appComponent: AppComponent
    init(appComponent: AppComponent) {
        self.appComponent = appComponent
    }
}
/// ^->AppComponent->SignupPasswordComponent
private func factorye93d1d56840ff97c674af47b58f8f304c97af4d5(_ component: NeedleFoundation.Scope) -> AnyObject {
    return SignupPasswordDependency778bf5389a70d7df6152Provider(appComponent: parent1(component) as! AppComponent)
}
private class SignupInfoDependency76f0cca8f78295db6e25Provider: SignupInfoDependency {


    init() {

    }
}
/// ^->AppComponent->SignupInfoComponent
private func factoryf65b1c12d971bd932996e3b0c44298fc1c149afb(_ component: NeedleFoundation.Scope) -> AnyObject {
    return SignupInfoDependency76f0cca8f78295db6e25Provider()
}
private class SignupEmployeeInfoDependency7f1092640a8ab85d9aeaProvider: SignupEmployeeInfoDependency {
    var signupVerifyComponent: SignupVerifyComponent {
        return appComponent.signupVerifyComponent
    }
    private let appComponent: AppComponent
    init(appComponent: AppComponent) {
        self.appComponent = appComponent
    }
}
/// ^->AppComponent->SignupEmployeeInfoComponent
private func factory85693d36827c3c0e8881f47b58f8f304c97af4d5(_ component: NeedleFoundation.Scope) -> AnyObject {
    return SignupEmployeeInfoDependency7f1092640a8ab85d9aeaProvider(appComponent: parent1(component) as! AppComponent)
}
private class SignupVerifyDependency19890686bff8e77ece06Provider: SignupVerifyDependency {
    var signupPasswordComponent: SignupPasswordComponent {
        return appComponent.signupPasswordComponent
    }
    private let appComponent: AppComponent
    init(appComponent: AppComponent) {
        self.appComponent = appComponent
    }
}
/// ^->AppComponent->SignupVerifyComponent
private func factoryf7587eff678919fec270f47b58f8f304c97af4d5(_ component: NeedleFoundation.Scope) -> AnyObject {
    return SignupVerifyDependency19890686bff8e77ece06Provider(appComponent: parent1(component) as! AppComponent)
}
private class MainTabDependency2826cdb310ed0b17a725Provider: MainTabDependency {


    init() {

    }
}
/// ^->AppComponent->MainTabComponent
private func factory1ab5a747ddf21e1393f9e3b0c44298fc1c149afb(_ component: NeedleFoundation.Scope) -> AnyObject {
    return MainTabDependency2826cdb310ed0b17a725Provider()
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
private class MyPageDepenedency48d84b530313b3ee40feProvider: MyPageDepenedency {
    var fetchMyProfileUseCase: any FetchMyProfileUseCase {
        return appComponent.fetchMyProfileUseCase
    }
    private let appComponent: AppComponent
    init(appComponent: AppComponent) {
        self.appComponent = appComponent
    }
}
/// ^->AppComponent->MyPageComponent
private func factory845932e18e133e23566ff47b58f8f304c97af4d5(_ component: NeedleFoundation.Scope) -> AnyObject {
    return MyPageDepenedency48d84b530313b3ee40feProvider(appComponent: parent1(component) as! AppComponent)
}
private class RootDependency3944cc797a4a88956fb5Provider: RootDependency {
    var introComponent: IntroComponent {
        return appComponent.introComponent
    }
    var mainTabComponent: MainTabComponent {
        return appComponent.mainTabComponent
    }
    private let appComponent: AppComponent
    init(appComponent: AppComponent) {
        self.appComponent = appComponent
    }
}
/// ^->AppComponent->RootComponent
private func factory264bfc4d4cb6b0629b40f47b58f8f304c97af4d5(_ component: NeedleFoundation.Scope) -> AnyObject {
    return RootDependency3944cc797a4a88956fb5Provider(appComponent: parent1(component) as! AppComponent)
}
private class FindAuthInfoTabDependency79082cf44b62999fcee0Provider: FindAuthInfoTabDependency {
    var findEmployeeIDComponent: FindEmployeeIDComponent {
        return appComponent.findEmployeeIDComponent
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
        localTable["uploadSingleFileUseCase-any UploadSingleFileUseCase"] = { self.uploadSingleFileUseCase as Any }
        localTable["uploadMultipleFileUseCase-any UploadMultipleFileUseCase"] = { self.uploadMultipleFileUseCase as Any }
        localTable["signinUseCase-any SigninUseCase"] = { self.signinUseCase as Any }
        localTable["signupUseCase-any SignupUseCase"] = { self.signupUseCase as Any }
        localTable["existsByNameAndEmployeeNumberUseCase-any ExistsByNameAndEmployeeNumberUseCase"] = { self.existsByNameAndEmployeeNumberUseCase as Any }
        localTable["existsByEmailUseCase-any ExistsByEmailUseCase"] = { self.existsByEmailUseCase as Any }
        localTable["fetchMyProfileUseCase-any FetchMyProfileUseCase"] = { self.fetchMyProfileUseCase as Any }
        localTable["changePasswordUseCase-any ChangePasswordUseCase"] = { self.changePasswordUseCase as Any }
        localTable["changeNicknameUseCase-any ChangeNicknameUseCase"] = { self.changeNicknameUseCase as Any }
        localTable["changeEmailUseCase-any ChangeEmailUseCase"] = { self.changeEmailUseCase as Any }
        localTable["changeProfileImageUseCase-any ChangeProfileImageUseCase"] = { self.changeProfileImageUseCase as Any }
        localTable["changeSpotUseCase-any ChangeSpotUseCase"] = { self.changeSpotUseCase as Any }
        localTable["verifyAuthCodeUseCase-any VerifyAuthCodeUseCase"] = { self.verifyAuthCodeUseCase as Any }
        localTable["sendAuthCodeUseCase-any SendAuthCodeUseCase"] = { self.sendAuthCodeUseCase as Any }
        localTable["fetchMenuListUseCase-any FetchMenuListUseCase"] = { self.fetchMenuListUseCase as Any }
        localTable["fetchPublicMenuListUseCase-any FetchPublicMenuListUseCase"] = { self.fetchPublicMenuListUseCase as Any }
    }
}
extension SignupPasswordComponent: Registration {
    public func registerItems() {
        keyPathToName[\SignupPasswordDependency.signupInfoComponent] = "signupInfoComponent-SignupInfoComponent"
    }
}
extension SignupInfoComponent: Registration {
    public func registerItems() {

    }
}
extension SignupEmployeeInfoComponent: Registration {
    public func registerItems() {
        keyPathToName[\SignupEmployeeInfoDependency.signupVerifyComponent] = "signupVerifyComponent-SignupVerifyComponent"
    }
}
extension SignupVerifyComponent: Registration {
    public func registerItems() {
        keyPathToName[\SignupVerifyDependency.signupPasswordComponent] = "signupPasswordComponent-SignupPasswordComponent"
    }
}
extension MainTabComponent: Registration {
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
extension MyPageComponent: Registration {
    public func registerItems() {
        keyPathToName[\MyPageDepenedency.fetchMyProfileUseCase] = "fetchMyProfileUseCase-any FetchMyProfileUseCase"
    }
}
extension RootComponent: Registration {
    public func registerItems() {
        keyPathToName[\RootDependency.introComponent] = "introComponent-IntroComponent"
        keyPathToName[\RootDependency.mainTabComponent] = "mainTabComponent-MainTabComponent"
    }
}
extension FindAuthInfoTabComponent: Registration {
    public func registerItems() {
        keyPathToName[\FindAuthInfoTabDependency.findEmployeeIDComponent] = "findEmployeeIDComponent-FindEmployeeIDComponent"
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
    registerProviderFactory("^->AppComponent->SignupPasswordComponent", factorye93d1d56840ff97c674af47b58f8f304c97af4d5)
    registerProviderFactory("^->AppComponent->SignupInfoComponent", factoryf65b1c12d971bd932996e3b0c44298fc1c149afb)
    registerProviderFactory("^->AppComponent->SignupEmployeeInfoComponent", factory85693d36827c3c0e8881f47b58f8f304c97af4d5)
    registerProviderFactory("^->AppComponent->SignupVerifyComponent", factoryf7587eff678919fec270f47b58f8f304c97af4d5)
    registerProviderFactory("^->AppComponent->MainTabComponent", factory1ab5a747ddf21e1393f9e3b0c44298fc1c149afb)
    registerProviderFactory("^->AppComponent->EmployeeIDResultComponent", factory7e57080bfb497fcb08dbe3b0c44298fc1c149afb)
    registerProviderFactory("^->AppComponent->FindEmployeeIDComponent", factoryfbe97e441ca213085fa6f47b58f8f304c97af4d5)
    registerProviderFactory("^->AppComponent->EmployeeIDSpotListComponent", factory529868f8afc90f854ddcf47b58f8f304c97af4d5)
    registerProviderFactory("^->AppComponent->MyPageComponent", factory845932e18e133e23566ff47b58f8f304c97af4d5)
    registerProviderFactory("^->AppComponent->RootComponent", factory264bfc4d4cb6b0629b40f47b58f8f304c97af4d5)
    registerProviderFactory("^->AppComponent->FindAuthInfoTabComponent", factory9e86e7b14b904564e8d9f47b58f8f304c97af4d5)
    registerProviderFactory("^->AppComponent->IntroComponent", factoryaf0e1f54bae4c77ad4ace3b0c44298fc1c149afb)
}
#endif

public func registerProviderFactories() {
#if !NEEDLE_DYNAMIC
    register1()
#endif
}
