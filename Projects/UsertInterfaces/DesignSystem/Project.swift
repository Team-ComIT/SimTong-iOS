import ProjectDescription
import ProjectDescriptionHelpers

let project = Project.makeModule(
    name: "DesignSystem",
    product: .framework,
    packages: [],
    dependencies: [
        .SPM.Lottie
    ],
    resources: ["Resources/**"]
)
