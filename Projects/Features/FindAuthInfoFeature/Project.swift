import ProjectDescription
import ProjectDescriptionHelpers

let project = Project.makeModule(
    name: "FindAuthInfoFeature",
    product: .staticFramework,
    dependencies: [
        .Project.Features.CommonFeature
    ]
)
