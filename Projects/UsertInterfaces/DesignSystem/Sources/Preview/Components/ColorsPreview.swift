import SwiftUI

struct ColorsPreview: View {
    var body: some View {
        let colors: [[Color]] = [
            [.main01, .main02, .main03, .main04, .main, .main06, .main07, .main08, .main09],
            [.gray01, .gray02, .gray03, .gray04, .gray05, .gray06, .gray07, .gray08, .grayMain],
            [.extraWhite, .extraBlack, .extraPrimary, .extraCheck, .extraError, .extraBackground]
        ]
        ZStack {
            Color.extraBackground
                .edgesIgnoringSafeArea(.all)
            VStack(alignment: .center, spacing: 30) {
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
}

struct ColorsPreview_Previews: PreviewProvider {
    static var previews: some View {
        ColorsPreview()
    }
}
