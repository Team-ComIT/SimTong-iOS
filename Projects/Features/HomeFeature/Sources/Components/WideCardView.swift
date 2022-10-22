import DesignSystem
import SwiftUI

struct WideCardView: View {
    let image: STImage
    let title: String
    let description: String

    var body: some View {
        HStack {
            image
                .frame(width: 40, height: 40)

            VStack(alignment: .leading, spacing: 2) {
                Text(title)
                    .stTypo(.m6, color: .gray08)

                Text(description)
                    .stTypo(.m7, color: .gray04)
            }

            Spacer()
        }
        .frame(maxWidth: .infinity)
        .padding(12)
        .background {
            Color.extraWhite
        }
        .cornerRadius(16)
    }
}
