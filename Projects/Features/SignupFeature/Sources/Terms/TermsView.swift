import SwiftUI
import DesignSystem

struct TermsView: View {
    @State var allAgreeState = false
    @State var agreedTerms: [Terms] = []
    
    var body: some View {
        VStack(alignment: .leading) {
            Text("약관동의")
                .stTypo(.s4, color: .black)
                .padding(.top, 28)
                .padding(.horizontal, 16)
            
            HStack(spacing: 8) {
//                TookCheckbox(isOn: $allAgreeState, willChange: { isOn in
//                    agreedTerms = isOn ? [] : Terms.allCases
//                    privacyTerms = !isOn
//                    print(agreedTerms)
//                })
                
                STCheckbox(isOn: $allAgreeState)

                Text("약관 전체동의")
                    .stTypo(.r5, color: .black)

                Spacer()
            }
            .padding(.top, 24)
        }
    }
}
