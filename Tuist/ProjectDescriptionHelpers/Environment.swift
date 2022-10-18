import ProjectDescription

public enum Environment {
    public static let appName = "SimTong"
    public static let targetName = "SimTong"
    public static let targetTestName = "\(targetName)Tests"
    public static let organizationName = "com.sungsimdang"
    public static let deploymentTarget: DeploymentTarget = .iOS(targetVersion: "15.0", devices: [.iphone, .ipad])
    public static let platform = Platform.iOS
    public static let baseSetting: SettingsDictionary = SettingsDictionary()
}
