import SwiftUI
import UIKit

fileprivate extension DesignSystemColors {
    var suiColor: SwiftUI.Color {
        return SwiftUI.Color(self.color)
    }
}
public extension Color {
    // MARK: - Main
    static let main01 = DesignSystemAsset.Colors.main01.suiColor
    static let main02 = DesignSystemAsset.Colors.main02.suiColor
    static let main03 = DesignSystemAsset.Colors.main03.suiColor
    static let main04 = DesignSystemAsset.Colors.main04.suiColor
    static let main05 = DesignSystemAsset.Colors.main05.suiColor
    static let main06 = DesignSystemAsset.Colors.main06.suiColor
    static let main07 = DesignSystemAsset.Colors.main07.suiColor
    static let main08 = DesignSystemAsset.Colors.main08.suiColor
    static let main09 = DesignSystemAsset.Colors.main09.suiColor

    // MARK: - Gray
    static let gray01 = DesignSystemAsset.Colors.gray01.suiColor
    static let gray02 = DesignSystemAsset.Colors.gray02.suiColor
    static let gray03 = DesignSystemAsset.Colors.gray03.suiColor
    static let gray04 = DesignSystemAsset.Colors.gray04.suiColor
    static let gray05 = DesignSystemAsset.Colors.gray05.suiColor
    static let gray06 = DesignSystemAsset.Colors.gray06.suiColor
    static let gray07 = DesignSystemAsset.Colors.gray07.suiColor
    static let gray08 = DesignSystemAsset.Colors.gray08.suiColor
    static let gray09 = DesignSystemAsset.Colors.gray09.suiColor

    // MARK: - Extra
    static let extraWhite = DesignSystemAsset.Colors.white.suiColor
    static let extraBlack = DesignSystemAsset.Colors.black.suiColor
    static let extraPrimary = DesignSystemAsset.Colors.primary.suiColor
    static let extraCheck = DesignSystemAsset.Colors.check.suiColor
    static let extraError = DesignSystemAsset.Colors.error.suiColor
    static let extraBackground = DesignSystemAsset.Colors.background.suiColor
}

struct Colors_Previews: PreviewProvider {
    static var previews: some View {
        VStack(alignment: .center, spacing: 30) {
            let colors: [[Color]] = [
                [.main01, .main02, .main03, .main04, .main05, .main06, .main07, .main08, .main09],
                [.gray01, .gray02, .gray03, .gray04, .gray05, .gray06, .gray07, .gray08, .gray09],
                [.extraWhite, .extraBlack, .extraPrimary, .extraCheck, .extraError, .extraBackground]
            ]
            ForEach(colors, id: \.self) { colors in
                HStack {
                    ForEach(colors, id: \.self) { main in
                        Rectangle()
                            .foregroundColor(main)
                            .frame(width: 30)
                    }
                }
                .frame(height: 30)
            }
        }
        .padding(.horizontal)
        .frame(maxWidth: .infinity)
    }
}
