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
  public enum Colors {
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
    public static let grayMain = DesignSystemColors(name: "GrayMain")
    public static let main = DesignSystemColors(name: "Main")
    public static let main01 = DesignSystemColors(name: "Main01")
    public static let main02 = DesignSystemColors(name: "Main02")
    public static let main03 = DesignSystemColors(name: "Main03")
    public static let main04 = DesignSystemColors(name: "Main04")
    public static let main06 = DesignSystemColors(name: "Main06")
    public static let main07 = DesignSystemColors(name: "Main07")
    public static let main08 = DesignSystemColors(name: "Main08")
    public static let main09 = DesignSystemColors(name: "Main09")
  }
  public enum Icons {
    public static let deal = DesignSystemImages(name: "deal")
    public static let dealFill = DesignSystemImages(name: "deal_fill")
    public static let home = DesignSystemImages(name: "home")
    public static let homeFill = DesignSystemImages(name: "home_fill")
    public static let idea = DesignSystemImages(name: "idea")
    public static let ideaFill = DesignSystemImages(name: "idea_fill")
    public static let news = DesignSystemImages(name: "news")
    public static let newsFill = DesignSystemImages(name: "news_fill")
    public static let vote = DesignSystemImages(name: "vote")
    public static let voteFill = DesignSystemImages(name: "vote_fill")
    public static let bell = DesignSystemImages(name: "bell")
    public static let bellBadge = DesignSystemImages(name: "bell_badge")
    public static let cartFill = DesignSystemImages(name: "cart_fill")
    public static let chevronDown = DesignSystemImages(name: "chevron_down")
    public static let chevronLeft = DesignSystemImages(name: "chevron_left")
    public static let clip = DesignSystemImages(name: "clip")
    public static let hand = DesignSystemImages(name: "hand")
    public static let handFill = DesignSystemImages(name: "hand_fill")
    public static let heart = DesignSystemImages(name: "heart")
    public static let heartFill = DesignSystemImages(name: "heart_fill")
    public static let message = DesignSystemImages(name: "message")
    public static let person = DesignSystemImages(name: "person")
    public static let plus = DesignSystemImages(name: "plus")
    public static let send = DesignSystemImages(name: "send")
    public static let signOut = DesignSystemImages(name: "sign_out")
    public static let trash = DesignSystemImages(name: "trash")
    public static let write = DesignSystemImages(name: "write")
    public static let xmark = DesignSystemImages(name: "xmark")
  }
  public enum Images {
    public static let introLogo = DesignSystemImages(name: "IntroLogo")
    public static let place1 = DesignSystemImages(name: "place1")
    public static let place2 = DesignSystemImages(name: "place2")
    public static let place3 = DesignSystemImages(name: "place3")
    public static let place4 = DesignSystemImages(name: "place4")
    public static let place5 = DesignSystemImages(name: "place5")
    public static let signinLogo = DesignSystemImages(name: "SigninLogo")
  }
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

public struct DesignSystemImages {
  public fileprivate(set) var name: String

  #if os(macOS)
  public typealias Image = NSImage
  #elseif os(iOS) || os(tvOS) || os(watchOS)
  public typealias Image = UIImage
  #endif

  public var image: Image {
    let bundle = DesignSystemResources.bundle
    #if os(iOS) || os(tvOS)
    let image = Image(named: name, in: bundle, compatibleWith: nil)
    #elseif os(macOS)
    let image = bundle.image(forResource: NSImage.Name(name))
    #elseif os(watchOS)
    let image = Image(named: name)
    #endif
    guard let result = image else {
      fatalError("Unable to load image asset named \(name).")
    }
    return result
  }
}

public extension DesignSystemImages.Image {
  @available(macOS, deprecated,
    message: "This initializer is unsafe on macOS, please use the DesignSystemImages.image property")
  convenience init?(asset: DesignSystemImages) {
    #if os(iOS) || os(tvOS)
    let bundle = DesignSystemResources.bundle
    self.init(named: asset.name, in: bundle, compatibleWith: nil)
    #elseif os(macOS)
    self.init(named: NSImage.Name(asset.name))
    #elseif os(watchOS)
    self.init(named: asset.name)
    #endif
  }
}

// swiftlint:enable all
// swiftformat:enable all
