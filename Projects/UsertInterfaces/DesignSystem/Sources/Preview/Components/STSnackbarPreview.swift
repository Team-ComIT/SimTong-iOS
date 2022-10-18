import SwiftUI

struct STSnackbarPreview: View {
    @State var isShowing = false
    var body: some View {
        VStack {
            Button {
                withAnimation {
                    isShowing.toggle()
                }
            } label: {
                Text("Snackbar")
            }

        }
        .stSnackbar(isShowing: $isShowing, text: "Text")
    }
}

struct STSnackbarPreview_Previews: PreviewProvider {
    static var previews: some View {
        STSnackbarPreview()
    }
}
