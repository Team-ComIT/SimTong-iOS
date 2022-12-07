

import BaseFeature
import DataModule
import DomainModule
import FindAuthInfoTabFeature
import FindEmployeeIDFeature
import FindPasswordFeature
import HomeFeature
import IntroFeature
import KeychainModule
import MainTabFeature
import NeedleFoundation
import NetworkModule
import RootFeature
import SigninFeature
import SignupFeature
import SplashFeature
import SwiftUI

// swiftlint:disable unused_declaration
private let needleDependenciesHash : String? = nil

// MARK: - Traversal Helpers

private func parent1(_ component: NeedleFoundation.Scope) -> NeedleFoundation.Scope {
    return component.parent
}

// MARK: - Providers

#if !NEEDLE_DYNAMIC

private class SplashDependencye0cb7136f2ec3edfd60aProvider: SplashDependency {
    var reissueTokenUseCase: any ReissueTokenUseCase {
        return appComponent.reissueTokenUseCase
    }
    private let appComponent: AppComponent
    init(appComponent: AppComponent) {
        self.appComponent = appComponent
    }
}
/// ^->AppComponent->SplashComponent
private func factoryace9f05f51d68f4c0677f47b58f8f304c97af4d5(_ component: NeedleFoundation.Scope) -> AnyObject {
    return SplashDependencye0cb7136f2ec3edfd60aProvider(appComponent: parent1(component) as! AppComponent)
}
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
    var checkExistNameAndEmployeeIDUseCase: any CheckExistNameAndEmployeeIDUseCase {
        return appComponent.checkExistNameAndEmployeeIDUseCase
    }
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
    var sendAuthCodeUseCase: any SendAuthCodeUseCase {
        return appComponent.sendAuthCodeUseCase
    }
    var verifyAuthCodeUseCase: any VerifyAuthCodeUseCase {
        return appComponent.verifyAuthCodeUseCase
    }
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
    var homeComponent: HomeComponent {
        return appComponent.homeComponent
    }
    private let appComponent: AppComponent
    init(appComponent: AppComponent) {
        self.appComponent = appComponent
    }
}
/// ^->AppComponent->MainTabComponent
private func factory1ab5a747ddf21e1393f9f47b58f8f304c97af4d5(_ component: NeedleFoundation.Scope) -> AnyObject {
    return MainTabDependency2826cdb310ed0b17a725Provider(appComponent: parent1(component) as! AppComponent)
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
    var introComponent: IntroComponent {
        return appComponent.introComponent
    }
    var mainTabComponent: MainTabComponent {
        return appComponent.mainTabComponent
    }
    var splashComponent: SplashComponent {
        return appComponent.splashComponent
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
private class SigninDependencyde06a9d0b22764487733Provider: SigninDependency {
    var findAuthInfoTabComponent: FindAuthInfoTabComponent {
        return appComponent.findAuthInfoTabComponent
    }
    var signupEmployeeInfoComponent: SignupEmployeeInfoComponent {
        return appComponent.signupEmployeeInfoComponent
    }
    var signinUseCase: any SigninUseCase {
        return appComponent.signinUseCase
    }
    private let appComponent: AppComponent
    init(appComponent: AppComponent) {
        self.appComponent = appComponent
    }
}
/// ^->AppComponent->SigninComponent
private func factory2882a056d84a613debccf47b58f8f304c97af4d5(_ component: NeedleFoundation.Scope) -> AnyObject {
    return SigninDependencyde06a9d0b22764487733Provider(appComponent: parent1(component) as! AppComponent)
}
private class HomeDependency443c4e1871277bd8432aProvider: HomeDependency {
    var fetchMenuListUseCase: any FetchMenuListUseCase {
        return appComponent.fetchMenuListUseCase
    }
    var fetchScheduleUseCase: any FetchScheduleUseCase {
        return appComponent.fetchScheduleUseCase
    }
    var writeHolidayComponent: WriteHolidayComponent {
        return appComponent.writeHolidayComponent
    }
    var scheduleCalendarComponent: ScheduleCalendarComponent {
        return appComponent.scheduleCalendarComponent
    }
    private let appComponent: AppComponent
    init(appComponent: AppComponent) {
        self.appComponent = appComponent
    }
}
/// ^->AppComponent->HomeComponent
private func factory67229cdf0f755562b2b1f47b58f8f304c97af4d5(_ component: NeedleFoundation.Scope) -> AnyObject {
    return HomeDependency443c4e1871277bd8432aProvider(appComponent: parent1(component) as! AppComponent)
}
private class ComposeScheduleDependency534591f9c4f254e49500Provider: ComposeScheduleDependency {
    var createNewScheduleUseCase: any CreateNewScheduleUseCase {
        return appComponent.createNewScheduleUseCase
    }
    var updateScheduleUseCase: any UpdateScheduleUseCase {
        return appComponent.updateScheduleUseCase
    }
    private let appComponent: AppComponent
    init(appComponent: AppComponent) {
        self.appComponent = appComponent
    }
}
/// ^->AppComponent->ComposeScheduleComponent
private func factory18d959497033aa79a250f47b58f8f304c97af4d5(_ component: NeedleFoundation.Scope) -> AnyObject {
    return ComposeScheduleDependency534591f9c4f254e49500Provider(appComponent: parent1(component) as! AppComponent)
}
private class ScheduleCalendarDependency82957fd936f8392eba72Provider: ScheduleCalendarDependency {
    var composeScheduleComponent: ComposeScheduleComponent {
        return appComponent.composeScheduleComponent
    }
    var deleteScheduleUseCase: any DeleteScheduleUseCase {
        return appComponent.deleteScheduleUseCase
    }
    var fetchScheduleUseCase: any FetchScheduleUseCase {
        return appComponent.fetchScheduleUseCase
    }
    private let appComponent: AppComponent
    init(appComponent: AppComponent) {
        self.appComponent = appComponent
    }
}
/// ^->AppComponent->ScheduleCalendarComponent
private func factory435d771786798070a01bf47b58f8f304c97af4d5(_ component: NeedleFoundation.Scope) -> AnyObject {
    return ScheduleCalendarDependency82957fd936f8392eba72Provider(appComponent: parent1(component) as! AppComponent)
}
private class WriteHolidayDependencyf70374d71937da494a07Provider: WriteHolidayDependency {


    init() {

    }
}
/// ^->AppComponent->WriteHolidayComponent
private func factory231bc78685abe84d7b9fe3b0c44298fc1c149afb(_ component: NeedleFoundation.Scope) -> AnyObject {
    return WriteHolidayDependencyf70374d71937da494a07Provider()
}
private class FindPasswordVerifyDependencye7e025c9e757c84d8b5eProvider: FindPasswordVerifyDependency {
    var sendAuthCodeUseCase: any SendAuthCodeUseCase {
        return appComponent.sendAuthCodeUseCase
    }
    var verifyAuthCodeUseCase: any VerifyAuthCodeUseCase {
        return appComponent.verifyAuthCodeUseCase
    }
    var renewalPasswordComponent: RenewalPasswordComponent {
        return appComponent.renewalPasswordComponent
    }
    private let appComponent: AppComponent
    init(appComponent: AppComponent) {
        self.appComponent = appComponent
    }
}
/// ^->AppComponent->FindPasswordVerifyComponent
private func factory573f446f1153613fedd6f47b58f8f304c97af4d5(_ component: NeedleFoundation.Scope) -> AnyObject {
    return FindPasswordVerifyDependencye7e025c9e757c84d8b5eProvider(appComponent: parent1(component) as! AppComponent)
}
private class FindPasswordInfoDependency2ddef0504ff382f9d508Provider: FindPasswordInfoDependency {
    var checkExistEmployeeIDAndEmailUseCase: any CheckExistEmployeeIDAndEmailUseCase {
        return appComponent.checkExistEmployeeIDAndEmailUseCase
    }
    var findPasswordVerifyComponent: FindPasswordVerifyComponent {
        return appComponent.findPasswordVerifyComponent
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
    var signinComponent: SigninComponent {
        return appComponent.signinComponent
    }
    var signupEmployeeInfoComponent: SignupEmployeeInfoComponent {
        return appComponent.signupEmployeeInfoComponent
    }
    private let appComponent: AppComponent
    init(appComponent: AppComponent) {
        self.appComponent = appComponent
    }
}
/// ^->AppComponent->IntroComponent
private func factoryaf0e1f54bae4c77ad4acf47b58f8f304c97af4d5(_ component: NeedleFoundation.Scope) -> AnyObject {
    return IntroDependencye04a89d39c733d937499Provider(appComponent: parent1(component) as! AppComponent)
}

#else
extension AppComponent: Registration {
    public func registerItems() {

        localTable["remoteCommonsDataSource-any RemoteCommonsDataSource"] = { self.remoteCommonsDataSource as Any }
        localTable["remoteFilesDataSource-any RemoteFilesDataSource"] = { self.remoteFilesDataSource as Any }
        localTable["remoteUsersDataSource-any RemoteUsersDataSource"] = { self.remoteUsersDataSource as Any }
        localTable["remoteEmailsDataSource-any RemoteEmailsDataSource"] = { self.remoteEmailsDataSource as Any }
        localTable["remoteMenuDataSource-any RemoteMenuDataSource"] = { self.remoteMenuDataSource as Any }
        localTable["remoteScheduleDataSource-any RemoteScheduleDataSource"] = { self.remoteScheduleDataSource as Any }
        localTable["commonsRepository-any CommonsRepository"] = { self.commonsRepository as Any }
        localTable["filesRepository-any FilesRepository"] = { self.filesRepository as Any }
        localTable["usersRepository-any UsersRepository"] = { self.usersRepository as Any }
        localTable["emailsRepository-any EmailsRepository"] = { self.emailsRepository as Any }
        localTable["menuRepository-any MenuRepository"] = { self.menuRepository as Any }
        localTable["scheduleRepository-any ScheduleRepository"] = { self.scheduleRepository as Any }
        localTable["fetchSpotListUseCase-any FetchSpotListUseCase"] = { self.fetchSpotListUseCase as Any }
        localTable["findEmployeeNumberUseCase-any FindEmployeeNumberUseCase"] = { self.findEmployeeNumberUseCase as Any }
        localTable["reissueTokenUseCase-any ReissueTokenUseCase"] = { self.reissueTokenUseCase as Any }
        localTable["resetPasswordUseCase-any ResetPasswordUseCase"] = { self.resetPasswordUseCase as Any }
        localTable["changePasswordUseCase-any ChangePasswordUseCase"] = { self.changePasswordUseCase as Any }
        localTable["checkExistEmployeeIDAndEmailUseCase-any CheckExistEmployeeIDAndEmailUseCase"] = { self.checkExistEmployeeIDAndEmailUseCase as Any }
        localTable["uploadSingleFileUseCase-any UploadSingleFileUseCase"] = { self.uploadSingleFileUseCase as Any }
        localTable["uploadMultipleFileUseCase-any UploadMultipleFileUseCase"] = { self.uploadMultipleFileUseCase as Any }
        localTable["signinUseCase-any SigninUseCase"] = { self.signinUseCase as Any }
        localTable["signupUseCase-any SignupUseCase"] = { self.signupUseCase as Any }
        localTable["checkExistNameAndEmployeeIDUseCase-any CheckExistNameAndEmployeeIDUseCase"] = { self.checkExistNameAndEmployeeIDUseCase as Any }
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
        localTable["fetchScheduleUseCase-any FetchScheduleUseCase"] = { self.fetchScheduleUseCase as Any }
        localTable["createNewScheduleUseCase-any CreateNewScheduleUseCase"] = { self.createNewScheduleUseCase as Any }
        localTable["updateScheduleUseCase-any UpdateScheduleUseCase"] = { self.updateScheduleUseCase as Any }
        localTable["deleteScheduleUseCase-any DeleteScheduleUseCase"] = { self.deleteScheduleUseCase as Any }
    }
}
extension SplashComponent: Registration {
    public func registerItems() {
        keyPathToName[\SplashDependency.reissueTokenUseCase] = "reissueTokenUseCase-any ReissueTokenUseCase"
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
        keyPathToName[\SignupEmployeeInfoDependency.checkExistNameAndEmployeeIDUseCase] = "checkExistNameAndEmployeeIDUseCase-any CheckExistNameAndEmployeeIDUseCase"
        keyPathToName[\SignupEmployeeInfoDependency.signupVerifyComponent] = "signupVerifyComponent-SignupVerifyComponent"
    }
}
extension SignupVerifyComponent: Registration {
    public func registerItems() {
        keyPathToName[\SignupVerifyDependency.sendAuthCodeUseCase] = "sendAuthCodeUseCase-any SendAuthCodeUseCase"
        keyPathToName[\SignupVerifyDependency.verifyAuthCodeUseCase] = "verifyAuthCodeUseCase-any VerifyAuthCodeUseCase"
        keyPathToName[\SignupVerifyDependency.signupPasswordComponent] = "signupPasswordComponent-SignupPasswordComponent"
    }
}
extension MainTabComponent: Registration {
    public func registerItems() {
        keyPathToName[\MainTabDependency.homeComponent] = "homeComponent-HomeComponent"
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
        keyPathToName[\RootDependency.introComponent] = "introComponent-IntroComponent"
        keyPathToName[\RootDependency.mainTabComponent] = "mainTabComponent-MainTabComponent"
        keyPathToName[\RootDependency.splashComponent] = "splashComponent-SplashComponent"
    }
}
extension SigninComponent: Registration {
    public func registerItems() {
        keyPathToName[\SigninDependency.findAuthInfoTabComponent] = "findAuthInfoTabComponent-FindAuthInfoTabComponent"
        keyPathToName[\SigninDependency.signupEmployeeInfoComponent] = "signupEmployeeInfoComponent-SignupEmployeeInfoComponent"
        keyPathToName[\SigninDependency.signinUseCase] = "signinUseCase-any SigninUseCase"
    }
}
extension HomeComponent: Registration {
    public func registerItems() {
        keyPathToName[\HomeDependency.fetchMenuListUseCase] = "fetchMenuListUseCase-any FetchMenuListUseCase"
        keyPathToName[\HomeDependency.fetchScheduleUseCase] = "fetchScheduleUseCase-any FetchScheduleUseCase"
        keyPathToName[\HomeDependency.writeHolidayComponent] = "writeHolidayComponent-WriteHolidayComponent"
        keyPathToName[\HomeDependency.scheduleCalendarComponent] = "scheduleCalendarComponent-ScheduleCalendarComponent"
    }
}
extension ComposeScheduleComponent: Registration {
    public func registerItems() {
        keyPathToName[\ComposeScheduleDependency.createNewScheduleUseCase] = "createNewScheduleUseCase-any CreateNewScheduleUseCase"
        keyPathToName[\ComposeScheduleDependency.updateScheduleUseCase] = "updateScheduleUseCase-any UpdateScheduleUseCase"
    }
}
extension ScheduleCalendarComponent: Registration {
    public func registerItems() {
        keyPathToName[\ScheduleCalendarDependency.composeScheduleComponent] = "composeScheduleComponent-ComposeScheduleComponent"
        keyPathToName[\ScheduleCalendarDependency.deleteScheduleUseCase] = "deleteScheduleUseCase-any DeleteScheduleUseCase"
        keyPathToName[\ScheduleCalendarDependency.fetchScheduleUseCase] = "fetchScheduleUseCase-any FetchScheduleUseCase"
    }
}
extension WriteHolidayComponent: Registration {
    public func registerItems() {

    }
}
extension FindPasswordVerifyComponent: Registration {
    public func registerItems() {
        keyPathToName[\FindPasswordVerifyDependency.sendAuthCodeUseCase] = "sendAuthCodeUseCase-any SendAuthCodeUseCase"
        keyPathToName[\FindPasswordVerifyDependency.verifyAuthCodeUseCase] = "verifyAuthCodeUseCase-any VerifyAuthCodeUseCase"
        keyPathToName[\FindPasswordVerifyDependency.renewalPasswordComponent] = "renewalPasswordComponent-RenewalPasswordComponent"
    }
}
extension FindPasswordInfoComponent: Registration {
    public func registerItems() {
        keyPathToName[\FindPasswordInfoDependency.checkExistEmployeeIDAndEmailUseCase] = "checkExistEmployeeIDAndEmailUseCase-any CheckExistEmployeeIDAndEmailUseCase"
        keyPathToName[\FindPasswordInfoDependency.findPasswordVerifyComponent] = "findPasswordVerifyComponent-FindPasswordVerifyComponent"
    }
}
extension RenewalPasswordComponent: Registration {
    public func registerItems() {
        keyPathToName[\RenewalPasswordDependency.resetPasswordUseCase] = "resetPasswordUseCase-any ResetPasswordUseCase"
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
        keyPathToName[\IntroDependency.signinComponent] = "signinComponent-SigninComponent"
        keyPathToName[\IntroDependency.signupEmployeeInfoComponent] = "signupEmployeeInfoComponent-SignupEmployeeInfoComponent"
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

@inline(never) private func register1() {
    registerProviderFactory("^->AppComponent", factoryEmptyDependencyProvider)
    registerProviderFactory("^->AppComponent->SplashComponent", factoryace9f05f51d68f4c0677f47b58f8f304c97af4d5)
    registerProviderFactory("^->AppComponent->SignupPasswordComponent", factorye93d1d56840ff97c674af47b58f8f304c97af4d5)
    registerProviderFactory("^->AppComponent->SignupInfoComponent", factoryf65b1c12d971bd932996e3b0c44298fc1c149afb)
    registerProviderFactory("^->AppComponent->SignupEmployeeInfoComponent", factory85693d36827c3c0e8881f47b58f8f304c97af4d5)
    registerProviderFactory("^->AppComponent->SignupVerifyComponent", factoryf7587eff678919fec270f47b58f8f304c97af4d5)
    registerProviderFactory("^->AppComponent->MainTabComponent", factory1ab5a747ddf21e1393f9f47b58f8f304c97af4d5)
    registerProviderFactory("^->AppComponent->EmployeeIDResultComponent", factory7e57080bfb497fcb08dbe3b0c44298fc1c149afb)
    registerProviderFactory("^->AppComponent->FindEmployeeIDComponent", factoryfbe97e441ca213085fa6f47b58f8f304c97af4d5)
    registerProviderFactory("^->AppComponent->EmployeeIDSpotListComponent", factory529868f8afc90f854ddcf47b58f8f304c97af4d5)
    registerProviderFactory("^->AppComponent->RootComponent", factory264bfc4d4cb6b0629b40f47b58f8f304c97af4d5)
    registerProviderFactory("^->AppComponent->SigninComponent", factory2882a056d84a613debccf47b58f8f304c97af4d5)
    registerProviderFactory("^->AppComponent->HomeComponent", factory67229cdf0f755562b2b1f47b58f8f304c97af4d5)
    registerProviderFactory("^->AppComponent->ComposeScheduleComponent", factory18d959497033aa79a250f47b58f8f304c97af4d5)
    registerProviderFactory("^->AppComponent->ScheduleCalendarComponent", factory435d771786798070a01bf47b58f8f304c97af4d5)
    registerProviderFactory("^->AppComponent->WriteHolidayComponent", factory231bc78685abe84d7b9fe3b0c44298fc1c149afb)
    registerProviderFactory("^->AppComponent->FindPasswordVerifyComponent", factory573f446f1153613fedd6f47b58f8f304c97af4d5)
    registerProviderFactory("^->AppComponent->FindPasswordInfoComponent", factory508fc8f893455de876c5f47b58f8f304c97af4d5)
    registerProviderFactory("^->AppComponent->RenewalPasswordComponent", factory236a429a80d834e1f370f47b58f8f304c97af4d5)
    registerProviderFactory("^->AppComponent->FindAuthInfoTabComponent", factory9e86e7b14b904564e8d9f47b58f8f304c97af4d5)
    registerProviderFactory("^->AppComponent->IntroComponent", factoryaf0e1f54bae4c77ad4acf47b58f8f304c97af4d5)
}
#endif

public func registerProviderFactories() {
#if !NEEDLE_DYNAMIC
    register1()
#endif
}
