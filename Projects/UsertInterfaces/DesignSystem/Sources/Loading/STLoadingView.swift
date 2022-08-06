import SwiftUI

struct STLoadingView: View {
    @State var play = false
    var body: some View {
        LottieUIView(name: "SimTongLoading", play: $play)
            .onAppear {
                play.toggle()
            }
    }
}

struct STLoadingView_Previews: PreviewProvider {
    static var previews: some View {
        STLoadingView()
    }
}
