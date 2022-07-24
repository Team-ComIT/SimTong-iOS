// swiftlint:disable all
// swift-format-ignore-file
// swiftformat:disable all
// Generated using tuist — https://github.com/tuist/tuist

#if os(macOS)
  import AppKit
#elseif os(iOS)
  import UIKit
#elseif os(tvOS) || os(watchOS)
  import UIKit
#endif

// swiftlint:disable superfluous_disable_command file_length implicit_return

// MARK: - Asset Catalogs

// swiftlint:disable identifier_name line_length nesting type_body_length type_name
public enum DesignSystemAsset {
  public static let background = DesignSystemColors(name: "Background")
  public static let black = DesignSystemColors(name: "Black")
  public static let check = DesignSystemColors(name: "Check")
  public static let error = DesignSystemColors(name: "Error")
  public static let primary = DesignSystemColors(name: "Primary")
  public static let white = DesignSystemColors(name: "White")
  public static let gray01 = DesignSystemColors(name: "Gray01")
  public static let gray02 = DesignSystemColors(name: "Gray02")
  public static let gray03 = DesignSystemColors(name: "Gray03")
  public static let gray04 = DesignSystemColors(name: "Gray04")
  public static let gray05 = DesignSystemColors(name: "Gray05")
  public static let gray06 = DesignSystemColors(name: "Gray06")
  public static let gray07 = DesignSystemColors(name: "Gray07")
  public static let gray08 = DesignSystemColors(name: "Gray08")
  public static let gray09 = DesignSystemColors(name: "Gray09")
  public static let main01 = DesignSystemColors(name: "Main01")
  public static let main02 = DesignSystemColors(name: "Main02")
  public static let main03 = DesignSystemColors(name: "Main03")
  public static let main04 = DesignSystemColors(name: "Main04")
  public static let main05 = DesignSystemColors(name: "Main05")
  public static let main06 = DesignSystemColors(name: "Main06")
  public static let main07 = DesignSystemColors(name: "Main07")
  public static let main08 = DesignSystemColors(name: "Main08")
  public static let main09 = DesignSystemColors(name: "Main09")
}
// swiftlint:enable identifier_name line_length nesting type_body_length type_name

// MARK: - Implementation Details

public final class DesignSystemColors {
  public fileprivate(set) var name: String

  #if os(macOS)
  public typealias Color = NSColor
  #elseif os(iOS) || os(tvOS) || os(watchOS)
  public typealias Color = UIColor
  #endif

  @available(iOS 11.0, tvOS 11.0, watchOS 4.0, macOS 10.13, *)
  public private(set) lazy var color: Color = {
    guard let color = Color(asset: self) else {
      fatalError("Unable to load color asset named \(name).")
    }
    return color
  }()

  fileprivate init(name: String) {
    self.name = name
  }
}

public extension DesignSystemColors.Color {
  @available(iOS 11.0, tvOS 11.0, watchOS 4.0, macOS 10.13, *)
  convenience init?(asset: DesignSystemColors) {
    let bundle = DesignSystemResources.bundle
    #if os(iOS) || os(tvOS)
    self.init(named: asset.name, in: bundle, compatibleWith: nil)
    #elseif os(macOS)
    self.init(named: NSColor.Name(asset.name), bundle: bundle)
    #elseif os(watchOS)
    self.init(named: asset.name)
    #endif
  }
}

// swiftlint:enable all
// swiftformat:enable all
