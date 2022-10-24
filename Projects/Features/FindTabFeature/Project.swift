import ProjectDescription
import ProjectDescriptionHelpers

let project = Project.makeModule(
    name: "FindTabFeature",
    product: .staticFramework,
    dependencies: [
        .Project.Features.BaseFeature,
        .Project.Features.FindEmployeeIDFeature,
        .Project.Features.FindPasswordFeature
    ]
)
