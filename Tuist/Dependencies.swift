import ProjectDescription
import ConfigurationPlugin

let dependencies = Dependencies(
    carthage: nil,
    swiftPackageManager: SwiftPackageManagerDependencies(
        [
            .remote(url: "https://github.com/Team-ComIT/Moya.git", requirement: .exact("15.0.4")),
            .remote(url: "https://github.com/Quick/Nimble.git", requirement: .exact("11.2.1")),
            .remote(url: "https://github.com/Quick/Quick.git", requirement: .exact("6.1.0"))
        ],
        baseSettings: .settings(
            configurations: [
                .debug(name: .dev),
                .debug(name: .stage),
                .release(name: .prod)
            ]
        )
    ),
    platforms: [.iOS]
)
