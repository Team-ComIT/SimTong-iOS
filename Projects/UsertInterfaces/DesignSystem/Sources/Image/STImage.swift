import SwiftUI

fileprivate extension DesignSystemImages {
    var suiImage: SwiftUI.Image {
        SwiftUI.Image(uiImage: self.image)
    }
}

public struct STImage: View {
    var image: Image
    var renderingMode: SwiftUI.Image.TemplateRenderingMode

    public init(
        _ image: Image,
        renderingMode: SwiftUI.Image.TemplateRenderingMode
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
    }

    public var body: some View {
        imageToImage()
            .resizable()
            .renderingMode(renderingMode)
    }

    private func imageToImage() -> SwiftUI.Image {
        switch image {
        case .place1:
            return DesignSystemAsset.Images.place1.suiImage
        case .place2:
            return DesignSystemAsset.Images.place2.suiImage
        case .place3:
            return DesignSystemAsset.Images.place3.suiImage
        case .place4:
            return DesignSystemAsset.Images.place4.suiImage
        case .place5:
            return DesignSystemAsset.Images.place5.suiImage
        }
    }
}
