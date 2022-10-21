import ProjectDescription
import ProjectDescriptionHelpers

let project = Project.makeModule(
    name: "FindPasswordFeature",
    product: .staticFramework,
    dependencies: [
        .Project.Features.BaseFeature
    ]
)
