// swiftlint:disable cyclomatic_complexity function_body_length superfluous_disable_command
import SwiftUI

fileprivate extension DesignSystemImages {
    var suiImage: SwiftUI.Image {
        SwiftUI.Image(uiImage: self.image)
    }
}

public struct STIcon: View {
    public init(
        _ icon: Icon,
        color: Color = .gray05,
        width: CGFloat = 28,
        height: CGFloat = 28,
        renderingMode: Image.TemplateRenderingMode = .template
    ) {
        self.icon = icon
        self.color = color
        self.width = width
        self.height = height
        self.renderingMode = renderingMode
    }

    public enum Icon: CaseIterable {
        case bell
        case bellBadge
        case person
        case message
        case heart
        case heartFill
        case hand
        case handFill
        case plus
        case signOut
        case write
        case trash
        case clip
        case cartFill
        case send
        case xmark
        case chevronDown
        case back

        case home
        case homeFill
        case news
        case newsFill
        case vote
        case voteFill
        case idea
        case ideaFill
        case deal
        case dealFill
    }
    var icon: Icon
    var color: Color
    var renderingMode: Image.TemplateRenderingMode
    var width: CGFloat
    var height: CGFloat

    public var body: some View {
        iconToImage()
            .resizable()
            .renderingMode(renderingMode)
            .foregroundColor(color)
            .frame(width: width, height: height)
    }

    private func iconToImage() -> Image {
        switch icon {
        case .bell:
            return DesignSystemAsset.Icons.bell.suiImage
        case .bellBadge:
            return DesignSystemAsset.Icons.bellBadge.suiImage
        case .person:
            return DesignSystemAsset.Icons.person.suiImage
        case .message:
            return DesignSystemAsset.Icons.message.suiImage
        case .heart:
            return DesignSystemAsset.Icons.heart.suiImage
        case .heartFill:
            return DesignSystemAsset.Icons.heartFill.suiImage
        case .hand:
            return DesignSystemAsset.Icons.hand.suiImage
        case .handFill:
            return DesignSystemAsset.Icons.handFill.suiImage
        case .plus:
            return DesignSystemAsset.Icons.plus.suiImage
        case .signOut:
            return DesignSystemAsset.Icons.signOut.suiImage
        case .write:
            return DesignSystemAsset.Icons.write.suiImage
        case .trash:
            return DesignSystemAsset.Icons.trash.suiImage
        case .clip:
            return DesignSystemAsset.Icons.clip.suiImage
        case .cartFill:
            return DesignSystemAsset.Icons.cartFill.suiImage
        case .send:
            return DesignSystemAsset.Icons.send.suiImage
        case .xmark:
            return DesignSystemAsset.Icons.xmark.suiImage
        case .chevronDown:
            return DesignSystemAsset.Icons.chevronDown.suiImage
        case .back:
            return DesignSystemAsset.Icons.chevronLeft.suiImage
        case .home:
            return DesignSystemAsset.Icons.home.suiImage
        case .homeFill:
            return DesignSystemAsset.Icons.homeFill.suiImage
        case .news:
            return DesignSystemAsset.Icons.news.suiImage
        case .newsFill:
            return DesignSystemAsset.Icons.newsFill.suiImage
        case .vote:
            return DesignSystemAsset.Icons.vote.suiImage
        case .voteFill:
            return DesignSystemAsset.Icons.voteFill.suiImage
        case .idea:
            return DesignSystemAsset.Icons.idea.suiImage
        case .ideaFill:
            return DesignSystemAsset.Icons.ideaFill.suiImage
        case .deal:
            return DesignSystemAsset.Icons.deal.suiImage
        case .dealFill:
            return DesignSystemAsset.Icons.dealFill.suiImage
        }
    }
}

public struct Icons_Previews: PreviewProvider {
    public static var previews: some View {
        let column = Array(repeating: GridItem(.fixed(35)), count: 7)
        LazyVGrid(columns: column, alignment: .center) {
            ForEach(STIcon.Icon.allCases, id: \.self) { icon in
                STIcon(icon)
            }
            STIcon(.xmark, color: .extraBlack)
            STIcon(.heartFill, color: .main05)
        }
    }
}
