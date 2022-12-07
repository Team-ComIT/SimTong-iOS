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
                STCheckbox(isOn: $allAgreeState, willChange: { isOn in
                    agreedTerms = isOn ? [] : Terms.allCases
                    privacyTerms = !isOn
                })

                Text("약관 전체동의")
                    .stTypo(.r5, color: .black)

                Spacer()
            }
            .padding(.top, 24)
            .onTapGesture {
                agreedTerms = allAgreeState ? [] : Terms.allCases
                privacyTerms = !allAgreeState
                allAgreeState = !allAgreeState
            }

            Divider()
                .padding(.vertical, 16)

            VStack(alignment: .leading) {
                Group {
                    termsRow(term: .privacy, isOn: $privacyTerms)
                }
            }

            Spacer()

            CTAButton(text: "확인", action: allAgreeAction)
                .disabled(!allAgreeState)
                .padding(.bottom, 16)
                .padding(.top, 32)
        }
        .padding(.horizontal, 16)
    }

    @ViewBuilder
    func termsRow(term: Terms, isOn: Binding<Bool>) -> some View {
        HStack {
            STCheckbox(isOn: isOn, willChange: { isChecked in
                if isChecked {
                    agreedTerms.removeAll { $0 == term }
                } else {
                    agreedTerms.append(term)
                }
                withAnimation {
                    allAgreeState = agreedTerms == Terms.allCases
                }
            })

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
        .onTapGesture {
            if isOn.wrappedValue {
                agreedTerms.removeAll { $0 == term }
            } else {
                agreedTerms.append(term)
            }
            withAnimation {
                allAgreeState = agreedTerms == Terms.allCases
            }
            isOn.wrappedValue.toggle()
        }
    }
}
