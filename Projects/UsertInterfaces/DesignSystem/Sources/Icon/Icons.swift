// swiftlint:disable cyclomatic_complexity function_body_length superfluous_disable_command
import SwiftUI

fileprivate extension DesignSystemImages {
    var suiImage: SwiftUI.Image {
        SwiftUI.Image(uiImage: self.image)
    }
}

struct STIcon: View {
    enum Icon {
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
    }
    var icon: Icon
    var color: Color?

    var body: some View {
        makeImage()
    }

    func makeImage() -> some View {
        iconToImage()
            .renderingMode(.template)
            .foregroundColor(color ?? .gray05)
            .frame(width: 28, height: 28)
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
        }
    }
}

struct Icons_Previews: PreviewProvider {
    static var previews: some View {
        VStack {
            STIcon(icon: .trash)
        }
    }
}
