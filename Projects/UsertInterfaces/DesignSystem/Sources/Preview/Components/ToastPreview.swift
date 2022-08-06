import SwiftUI

struct ToastPreview: View {
    @State var successIsShow = false
    @State var failedIsShow = false
    @State var noneIsShow = false
    var body: some View {
        ZStack {
            Color.extraBackground
                .ignoresSafeArea()
            VStack(spacing: 30) {
                Button {
                    withAnimation {
                        successIsShow.toggle()
                    }
                } label: {
                    Text("Success")
                }
                Button {
                    withAnimation {
                        failedIsShow.toggle()
                    }
                } label: {
                    Text("Failed")
                }
                Button {
                    withAnimation {
                        noneIsShow.toggle()
                    }
                } label: {
                    Text("None")
                }
            }
            .stToast(isShowing: $successIsShow, message: "Success")
            .stToast(isShowing: $failedIsShow, message: "Failed", icon: .failed)
            .stToast(isShowing: $noneIsShow, message: "None", icon: .none)
        }
    }
}
