import ProjectDescription

public extension TargetDependency {
    struct SPM {}
}

public extension TargetDependency.SPM {
    static let TheComposableArchitecture = TargetDependency.external(name: "ComposableArchitecture")
    static let Moya = TargetDependency.external(name: "Moya")
}

public extension Package {
}
