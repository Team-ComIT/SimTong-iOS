import DesignSystem
import DomainModule
import SwiftUI

struct MenuCardView: View {
    let menu: MenuEntity

    var body: some View {
        VStack(alignment: .leading) {
            VStack(alignment: .leading, spacing: 8) {
                Text("\(menu.date.toSmallSimtongDate().month)월 \(menu.date.toSmallSimtongDate().day)일")
                    .stTypo(.r7, color: .extraBlack)
                    .padding(.bottom, 8)

                ForEach(menu.meal, id: \.self) { meal in
                    Text(meal)
                        .stTypo(.m5, color: .grayMain)
                        .frame(maxHeight: .infinity)
                }
            }
            .padding(20)
        }
        .frame(width: 168, height: 272)
        .background {
            STImage(.rice, renderingMode: .original)
        }
        .cornerRadius(16)
    }
}
