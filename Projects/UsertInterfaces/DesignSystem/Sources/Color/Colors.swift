import SwiftUI
import UIKit

fileprivate extension DesignSystemColors {
    var suiColor: SwiftUI.Color {
        return SwiftUI.Color(self.color)
    }
}
public extension Color {
    // MARK: - Main
    static let main01 = DesignSystemAsset.main01.suiColor
    static let main02 = DesignSystemAsset.main02.suiColor
    static let main03 = DesignSystemAsset.main03.suiColor
    static let main04 = DesignSystemAsset.main04.suiColor
    static let main05 = DesignSystemAsset.main05.suiColor
    static let main06 = DesignSystemAsset.main06.suiColor
    static let main07 = DesignSystemAsset.main07.suiColor
    static let main08 = DesignSystemAsset.main08.suiColor
    static let main09 = DesignSystemAsset.main09.suiColor

    // MARK: - Gray
    static let gray01 = DesignSystemAsset.gray01.suiColor
    static let gray02 = DesignSystemAsset.gray02.suiColor
    static let gray03 = DesignSystemAsset.gray03.suiColor
    static let gray04 = DesignSystemAsset.gray04.suiColor
    static let gray05 = DesignSystemAsset.gray05.suiColor
    static let gray06 = DesignSystemAsset.gray06.suiColor
    static let gray07 = DesignSystemAsset.gray07.suiColor
    static let gray08 = DesignSystemAsset.gray08.suiColor
    static let gray09 = DesignSystemAsset.gray09.suiColor

    // MARK: - Extra
    static let extraWhite = DesignSystemAsset.white.suiColor
    static let extraBlack = DesignSystemAsset.black.suiColor
    static let extraPrimary = DesignSystemAsset.primary.suiColor
    static let extraCheck = DesignSystemAsset.check.suiColor
    static let extraError = DesignSystemAsset.error.suiColor
    static let extraBackground = DesignSystemAsset.background.suiColor
}

public struct Colors_Previews: PreviewProvider {
    public static var previews: some View {
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
