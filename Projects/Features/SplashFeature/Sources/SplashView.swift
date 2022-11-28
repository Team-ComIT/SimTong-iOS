import BaseFeature
import DesignSystem
import SwiftUI

struct SplashView: View {
    @EnvironmentObject var appState: AppState
    @StateObject var viewModel: SplashViewModel

    init(
        viewModel: SplashViewModel
    ) {
        _viewModel = StateObject(wrappedValue: viewModel)
    }

    var body: some View {
        VStack {}
            .task {
                await viewModel.onAppear()
            }
            .onChange(of: viewModel.isAutoSignin) { newValue in
                withAnimation {
                    print("newValue", newValue)
                    if let newValue, newValue {
                        appState.sceneFlow = .main
                    } else {
                        appState.sceneFlow = .intro
                    }
                }
            }
    }
}
