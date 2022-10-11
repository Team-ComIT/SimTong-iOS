import SwiftUI

struct IconsPreview: View {
    var body: some View {
        let column = Array(repeating: GridItem(.fixed(35)), count: 7)
        ZStack {
            Color.extraBackground
                .edgesIgnoringSafeArea(.all)
            LazyVGrid(columns: column, alignment: .center) {
                ForEach(STIcon.Icon.allCases, id: \.self) { icon in
                    STIcon(icon)
                }
                STIcon(.xmark, color: .extraBlack)
                STIcon(.heartFill, color: .main)
            }
        }
    }
}

struct IconsPreview_Previews: PreviewProvider {
    static var previews: some View {
        IconsPreview()
    }
}
