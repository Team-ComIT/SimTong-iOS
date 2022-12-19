// swiftlint:disable all
import ProjectDescription

public extension TargetDependency {
    struct SPM {}
}

public extension TargetDependency.SPM {
    static let Lottie = TargetDependency.external(name: "Lottie")
    static let Needle = TargetDependency.external(name: "NeedleFoundation")
    static let Moya = TargetDependency.external(name: "Moya")
    static let Quick = TargetDependency.external(name: "Quick")
    static let Nimble = TargetDependency.external(name: "Nimble")
    static let FCM = TargetDependency.external(name: "FirebaseMessaging")
}
