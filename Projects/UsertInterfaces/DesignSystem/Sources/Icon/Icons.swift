// swiftlint:disable cyclomatic_complexity function_body_length superfluous_disable_command
import SwiftUI

fileprivate extension DesignSystemImages {
    var suiImage: SwiftUI.Image {
        SwiftUI.Image(uiImage: self.image)
    }
}

public struct STIcon: View {
    public init(_ icon: Icon, color: Color? = nil) {
        self.icon = icon
        self.color = color
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
    var color: Color?

    public var body: some View {
        iconToImage()
            .foregroundColor(color ?? .gray05)
            .frame(width: 28, height: 28)
    }

    private func iconToImage() -> Image {
        switch icon {
        case .bell:
            return DesignSystemAsset.Icons.bell.suiImage
                .renderingMode(.template)
        case .bellBadge:
            return DesignSystemAsset.Icons.bellBadge.suiImage
                .renderingMode(.original)
        case .person:
            return DesignSystemAsset.Icons.person.suiImage
                .renderingMode(.template)
        case .message:
            return DesignSystemAsset.Icons.message.suiImage
                .renderingMode(.template)
        case .heart:
            return DesignSystemAsset.Icons.heart.suiImage
                .renderingMode(.template)
        case .heartFill:
            return DesignSystemAsset.Icons.heartFill.suiImage
                .renderingMode(.template)
        case .hand:
            return DesignSystemAsset.Icons.hand.suiImage
                .renderingMode(.template)
        case .handFill:
            return DesignSystemAsset.Icons.handFill.suiImage
                .renderingMode(.template)
        case .plus:
            return DesignSystemAsset.Icons.plus.suiImage
                .renderingMode(.template)
        case .signOut:
            return DesignSystemAsset.Icons.signOut.suiImage
                .renderingMode(.template)
        case .write:
            return DesignSystemAsset.Icons.write.suiImage
                .renderingMode(.template)
        case .trash:
            return DesignSystemAsset.Icons.trash.suiImage
                .renderingMode(.template)
        case .clip:
            return DesignSystemAsset.Icons.clip.suiImage
                .renderingMode(.template)
        case .cartFill:
            return DesignSystemAsset.Icons.cartFill.suiImage
                .renderingMode(.template)
        case .send:
            return DesignSystemAsset.Icons.send.suiImage
                .renderingMode(.template)
        case .xmark:
            return DesignSystemAsset.Icons.xmark.suiImage
                .renderingMode(.template)
        case .chevronDown:
            return DesignSystemAsset.Icons.chevronDown.suiImage
                .renderingMode(.template)
        case .back:
            return DesignSystemAsset.Icons.chevronLeft.suiImage
                .renderingMode(.template)
        case .home:
            return DesignSystemAsset.Icons.home.suiImage
                .renderingMode(.template)
        case .homeFill:
            return DesignSystemAsset.Icons.homeFill.suiImage
                .renderingMode(.template)
        case .news:
            return DesignSystemAsset.Icons.news.suiImage
                .renderingMode(.template)
        case .newsFill:
            return DesignSystemAsset.Icons.newsFill.suiImage
                .renderingMode(.template)
        case .vote:
            return DesignSystemAsset.Icons.vote.suiImage
                .renderingMode(.template)
        case .voteFill:
            return DesignSystemAsset.Icons.voteFill.suiImage
                .renderingMode(.template)
        case .idea:
            return DesignSystemAsset.Icons.idea.suiImage
                .renderingMode(.template)
        case .ideaFill:
            return DesignSystemAsset.Icons.ideaFill.suiImage
                .renderingMode(.template)
        case .deal:
            return DesignSystemAsset.Icons.deal.suiImage
                .renderingMode(.template)
        case .dealFill:
            return DesignSystemAsset.Icons.dealFill.suiImage
                .renderingMode(.template)
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
