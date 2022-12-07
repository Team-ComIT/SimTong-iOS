import UIKit
import Lottie

public final class LottieWrappedView: UIView {
    let animationView: LottieAnimationView

    public init(animation: LottieAnimation?) {
        let animationView = LottieAnimationView(
            animation: animation,
            configuration: .init(renderingEngine: .coreAnimation)
        )
        animationView.translatesAutoresizingMaskIntoConstraints = false
        self.animationView = animationView

        super.init(frame: .zero)

        addSubview(animationView)
        NSLayoutConstraint.activate([
            animationView.topAnchor.constraint(equalTo: self.topAnchor),
            animationView.leadingAnchor.constraint(equalTo: self.leadingAnchor),
            animationView.bottomAnchor.constraint(equalTo: self.bottomAnchor),
            animationView.trailingAnchor.constraint(equalTo: self.trailingAnchor)
        ])
    }

    required init?(coder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }
}

extension LottieWrappedView {
    var loopMode: LottieLoopMode {
        get { animationView.loopMode }
        set { animationView.loopMode = newValue }
    }

    func play() {
        animationView.play()
    }

    func stop() {
        animationView.stop()
    }
}
