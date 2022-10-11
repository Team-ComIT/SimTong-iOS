

import DataModule
import DomainModule
import FindAuthInfoFeature
import IntroFeature
import KeychainModule
import NeedleFoundation
import NetworkModule
import RootFeature
import SwiftUI

// swiftlint:disable unused_declaration
private let needleDependenciesHash : String? = nil

// MARK: - Traversal Helpers

private func parent1(_ component: NeedleFoundation.Scope) -> NeedleFoundation.Scope {
    return component.parent
}

// MARK: - Providers

#if !NEEDLE_DYNAMIC

private class RootDependency3944cc797a4a88956fb5Provider: RootDependency {


    init() {

    }
}
/// ^->AppComponent->RootComponent
private func factory264bfc4d4cb6b0629b40e3b0c44298fc1c149afb(_ component: NeedleFoundation.Scope) -> AnyObject {
    return RootDependency3944cc797a4a88956fb5Provider()
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
private class FindEmployeeDependency636344242d29e7292bd9Provider: FindEmployeeDependency {
    var employeeIDSpotListComponent: EmployeeIDSpotListComponent {
        return appComponent.employeeIDSpotListComponent
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

        localTable["commonRemoteDataSource-any RemoteCommonDataSource"] = { self.commonRemoteDataSource as Any }
        localTable["commonRepository-any CommonRepository"] = { self.commonRepository as Any }
        localTable["fetchSpotListUseCase-any FetchSpotListUseCase"] = { self.fetchSpotListUseCase as Any }
    }
}
extension RootComponent: Registration {
    public func registerItems() {

    }
}
extension FindAuthInfoTabComponent: Registration {
    public func registerItems() {
        keyPathToName[\FindAuthInfoTabDependency.findEmployeeIDComponent] = "findEmployeeIDComponent-FindEmployeeIDComponent"
    }
}
extension FindEmployeeIDComponent: Registration {
    public func registerItems() {
        keyPathToName[\FindEmployeeDependency.employeeIDSpotListComponent] = "employeeIDSpotListComponent-EmployeeIDSpotListComponent"
    }
}
extension EmployeeIDSpotListComponent: Registration {
    public func registerItems() {
        keyPathToName[\EmployeeIDSpotListDependency.fetchSpotListUseCase] = "fetchSpotListUseCase-any FetchSpotListUseCase"
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
    registerProviderFactory("^->AppComponent->RootComponent", factory264bfc4d4cb6b0629b40e3b0c44298fc1c149afb)
    registerProviderFactory("^->AppComponent->FindAuthInfoTabComponent", factory9e86e7b14b904564e8d9f47b58f8f304c97af4d5)
    registerProviderFactory("^->AppComponent->FindEmployeeIDComponent", factoryfbe97e441ca213085fa6f47b58f8f304c97af4d5)
    registerProviderFactory("^->AppComponent->EmployeeIDSpotListComponent", factory529868f8afc90f854ddcf47b58f8f304c97af4d5)
    registerProviderFactory("^->AppComponent->IntroComponent", factoryaf0e1f54bae4c77ad4ace3b0c44298fc1c149afb)
}
#endif

public func registerProviderFactories() {
#if !NEEDLE_DYNAMIC
    register1()
#endif
}
