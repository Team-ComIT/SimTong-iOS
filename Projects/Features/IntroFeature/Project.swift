import ProjectDescription
import ProjectDescriptionHelpers

let project = Project.makeModule(
    name: "IntroFeature",
    product: .staticFramework,
    dependencies: [
        .Project.Features.BaseFeature,
        .Project.Features.FindAuthInfoFeature,
        .Project.Features.CommonFeature,
        .Project.Features.SignupFeature
    ]
)
