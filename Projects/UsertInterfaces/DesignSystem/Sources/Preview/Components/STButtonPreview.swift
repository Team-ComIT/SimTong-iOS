import SwiftUI

struct STButtonPreview: View {
    var body: some View {
        ZStack {
            Color.extraBackground
                .edgesIgnoringSafeArea(.all)
            VStack(spacing: 30) {
                Group {
                    CTAButton(text: "enabled") {
                        print("CTA - enabled")
                    }
                    CTAButton(text: "disabled")
                        .disabled(true)
                    CTAButton(text: "cancel", style: .cancel) {
                        print("CTA - cancel")
                    }
                }
                .padding(.horizontal)
                Divider()
                Group {
                    WideButton(text: "enabled") {
                        print("Wide - enabled")
                    }
                    WideButton(text: "disabled", style: .disabled)
                }
            }
        }
    }
}

struct STButtonPreview_Previews: PreviewProvider {
    static var previews: some View {
        STButtonPreview()
    }
}
