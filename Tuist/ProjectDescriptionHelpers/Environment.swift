import ProjectDescription

public enum Environment {
    public static let appName = "sim-tong"
    public static let targetName = "Simtong"
    public static let targetTestName = "\(targetName)Tests"
    public static let organizationName = "com.sungsimdang"
    public static let deploymentTarget: DeploymentTarget = .iOS(targetVersion: "15.0", devices: [.iphone])
    public static let platform = Platform.iOS
    public static let baseSetting: SettingsDictionary = ["OTHER_LDFLAGS": "$(inherited) -all_load"]
}
