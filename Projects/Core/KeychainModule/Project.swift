import ProjectDescription
import ProjectDescriptionHelpers
import DependencyPlugin

let project = Project.makeModule(
    name: ModulePaths.Core.KeychainModule.rawValue,
    product: .staticLibrary,
    targets: [.unitTest],
    internalDependencies: [
        .Shared.GlobalThirdPartyLibrary
    ]
)
