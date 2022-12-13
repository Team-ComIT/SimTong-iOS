import SwiftUI

public struct STImage: View {
    var image: Image
    var renderingMode: SwiftUI.Image.TemplateRenderingMode

    public init(
        _ image: Image,
        renderingMode: SwiftUI.Image.TemplateRenderingMode = .original
    ) {
        self.image = image
        self.renderingMode = renderingMode
    }

    public enum Image {
        case place1
        case place2
        case place3
        case place4
        case place5
        case introLogo
        case rice
        case pay
        case holiday
        case signinLogo
        case sungsimdang
        case sungsimdangFacebook
        case sungsimdangIntroduce
    }

    public var body: some View {
        imageToImage()
            .resizable()
            .renderingMode(renderingMode)
    }

    // swiftlint: disable cyclomatic_complexity
    private func imageToImage() -> SwiftUI.Image {
        switch image {
        case .place1:
            return DesignSystemAsset.Images.place1.swiftUIImage
        case .place2:
            return DesignSystemAsset.Images.place2.swiftUIImage
        case .place3:
            return DesignSystemAsset.Images.place3.swiftUIImage
        case .place4:
            return DesignSystemAsset.Images.place4.swiftUIImage
        case .place5:
            return DesignSystemAsset.Images.place5.swiftUIImage
        case .introLogo:
            return DesignSystemAsset.Images.introLogo.swiftUIImage
        case .rice:
            return DesignSystemAsset.Images.rice.swiftUIImage
        case .pay:
            return DesignSystemAsset.Images.pay.swiftUIImage
        case .holiday:
            return DesignSystemAsset.Images.holiday.swiftUIImage
        case .signinLogo:
            return DesignSystemAsset.Images.signinLogo.swiftUIImage
        case .sungsimdang:
            return DesignSystemAsset.Images.sungsimdang.swiftUIImage
        case .sungsimdangFacebook:
            return DesignSystemAsset.Images.sungsimdangFacebook.swiftUIImage
        case .sungsimdangIntroduce:
            return DesignSystemAsset.Images.sungsimdangIntroduce.swiftUIImage
        }
    }
}
