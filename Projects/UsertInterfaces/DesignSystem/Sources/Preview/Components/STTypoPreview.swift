import SwiftUI

struct STTypoPreview: View {
    var body: some View {
        let regulars: [STTypography.Style] = [.r1, .r2, .r3, .r4, .r5, .r6, .r7]
        let mediums: [STTypography.Style] = [.m1, .m2, .m3, .m4, .m5, .m6, .m7]
        let semis: [STTypography.Style] = [.s1, .s2, .s3, .s4, .s5, .s6, .s7]
        ZStack {
            Color.extraBackground
                .edgesIgnoringSafeArea(.all)
            ScrollView {
                VStack(spacing: 30) {
                    HStack {
                        Text("Regular")
                            .stTypo(.r1)
                        VStack(spacing: 15) {
                            ForEach(regulars, id: \.self) { font in
                                Text("Text")
                                    .stTypo(font)
                            }
                        }
                        .frame(maxWidth: .infinity)
                    }
                    .padding(.horizontal)
                    HStack {
                        Text("Medium")
                            .stTypo(.r1)
                        VStack(spacing: 15) {
                            ForEach(mediums, id: \.self) { font in
                                Text("Text")
                                    .stTypo(font)
                            }
                        }
                        .frame(maxWidth: .infinity)
                    }
                    .padding(.horizontal)
                    HStack {
                        Text("Semibold")
                            .stTypo(.r1)
                        VStack(spacing: 15) {
                            ForEach(semis, id: \.self) { font in
                                Text("Text")
                                    .stTypo(font)
                            }
                        }
                        .frame(maxWidth: .infinity)
                    }
                    .padding(.horizontal)
                }
            }
        }
    }
}

struct STTypoPreview_Previews: PreviewProvider {
    static var previews: some View {
        STTypoPreview()
    }
}
