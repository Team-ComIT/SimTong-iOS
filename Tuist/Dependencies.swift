import ProjectDescription
import ProjectDescriptionHelpers

let dependencies = Dependencies(
    swiftPackageManager: [
        .remote(url: "https://github.com/airbnb/lottie-ios.git", requirement: .upToNextMajor(from: "3.4.3")),
        .remote(url: "https://github.com/uber/needle.git", requirement: .upToNextMajor(from: "0.19.0"))
    ]
)
