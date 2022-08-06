import SwiftUI
import Lottie

public struct LottieUIView: UIViewRepresentable {
    @Binding var play: Bool
    let animation: Lottie.Animation?
    let loop: LottieLoopMode

    public init(
        name: String,
        play: Binding<Bool> = .constant(true),
        loop: LottieLoopMode = .loop
    ) {
        self.animation = .named(name)
        self.loop = loop
        self._play = play
    }

    public func makeUIView(context: Context) -> LottieWrappedView {
        let wrapper = LottieWrappedView(animation: animation)
        wrapper.loopMode = loop
        return wrapper
    }

    public func updateUIView(_ uiView: LottieWrappedView, context: Context) {
        uiView.loopMode = loop
        if play {
            uiView.play()
        } else {
            uiView.stop()
        }
    }
}
