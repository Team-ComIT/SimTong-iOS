import SwiftUI
import DesignSystem

public struct EmployeeIDResultView: View {
    @Environment(\.rootPresentationMode) var rootPresentationMode
    @Environment(\.dismiss) var dismiss

    let username: String
    let resultID: String

    public init(
        username: String,
        resultID: String
    ) {
        self.username = username
        self.resultID = resultID
    }

    public var body: some View {
        VStack {
            Spacer()

            Text("\(username) 회원님이\n요청하신 회원번호입니다.")
                .multilineTextAlignment(.center)
                .lineLimit(2)
                .stTypo(.r5, color: .gray09)

            RoundedRectangle(cornerRadius: 8)
                .fill(Color.gray02)
                .frame(width: 205, height: 42)
                .overlay {
                    Text(resultID)
                        .stTypo(.s4, color: .gray09)
                }

            Spacer()

            CTAButton(text: "로그인으로 이동하기") {
                rootPresentationMode.wrappedValue.toggle()
            }
            .padding(.horizontal)
            .padding(.bottom, 24)
        }
        .configBackButton(dismiss: dismiss)
    }
}

struct EmployeeIDResultView_Previews: PreviewProvider {
    static var previews: some View {
        EmployeeIDResultView(username: "최형우", resultID: "1234567")
    }
}
