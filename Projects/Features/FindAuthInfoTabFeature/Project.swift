import ProjectDescription
import ProjectDescriptionHelpers

let project = Project.makeModule(
    name: "FindAuthInfoTabFeature",
    product: .staticFramework,
    dependencies: [
        .Project.Features.BaseFeature,
        .Project.Features.FindEmployeeIDFeature,
        .Project.Features.FindPasswordFeature
    ]
)
