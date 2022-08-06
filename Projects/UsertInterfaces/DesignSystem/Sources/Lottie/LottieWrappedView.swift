import UIKit
import Lottie

public final class LottieWrappedView: UIView {
    let animationView: AnimationView

    public init(animation: Lottie.Animation?) {
        let animationView = AnimationView(animation: animation)
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
