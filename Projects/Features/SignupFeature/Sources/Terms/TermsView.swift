import SwiftUI
import DesignSystem

struct TermsView: View {
    @State var allAgreeState = false
    @State var agreedTerms: [Terms] = []
    @State var privacyTerms = false
    let allAgreeAction: () -> Void

    var body: some View {
        VStack(alignment: .leading) {
            Text("약관동의")
                .stTypo(.s4, color: .black)
                .padding(.top, 28)
                .padding(.horizontal, 16)

            HStack(spacing: 8) {
                STCheckbox(isOn: $allAgreeState)
                    .onChange(of: !allAgreeState) { isOn in
                        agreedTerms = isOn ? [] : Terms.allCases
                        privacyTerms = !isOn
                    }

                Text("약관 전체동의")
                    .stTypo(.r5, color: .black)

                Spacer()
            }
            .padding(.top, 24)

            Divider()
                .padding(.vertical, 16)

            VStack(alignment: .leading) {
                Group {
                    termsRow(term: .privacy, isOn: $privacyTerms)
                }
            }

            Spacer()

            CTAButton(text: "확인")

        }
        .padding(.horizontal, 16)
    }

    @ViewBuilder
    func termsRow(term: Terms, isOn: Binding<Bool>) -> some View {
        HStack {
            STCheckbox(isOn: isOn)

            Text(term.display)
                .stTypo(.r5, color: .gray05)

            Spacer()

            Link(destination: term.detailLink) {
                Image(systemName: "chevron.right")
                    .resizable()
                    .frame(width: 9, height: 16)
                    .foregroundColor(Color.gray03)
            }
        }
    }
}