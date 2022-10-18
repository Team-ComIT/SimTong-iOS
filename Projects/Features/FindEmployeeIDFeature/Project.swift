import ProjectDescription
import ProjectDescriptionHelpers

let project = Project.makeModule(
    name: "FindEmployeeIDFeature",
    product: .staticFramework,
    dependencies: [
        .Project.Features.BaseFeature
    ]
)
