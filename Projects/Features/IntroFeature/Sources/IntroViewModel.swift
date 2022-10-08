import Combine
import BaseFeature
import DesignSystem
import SwiftUI

public final class IntroViewModel: BaseViewModel {
    @Published var places: [STImage.Image] = [.place1, .place2, .place3, .place4, .place5]
    @Published var currentIndex = 0

    public override init() {
        super.init()
        Timer.scheduledTimer(withTimeInterval: 3.0, repeats: true) { [weak self] _ in
            guard let self = self else { return }
            withAnimation(.linear(duration: 0.75)) {
                self.currentIndex = (self.currentIndex + 1) >= self.places.count ? 0 : self.currentIndex + 1
            }
        }
    }
}
