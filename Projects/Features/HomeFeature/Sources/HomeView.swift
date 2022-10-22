import DesignSystem
import SwiftUI

struct HomeView: View {
    @StateObject var viewModel: HomeViewModel

    public init(viewModel: HomeViewModel) {
        _viewModel = StateObject(wrappedValue: viewModel)
    }

    var body: some View {
        ScrollView(showsIndicators: false) {
            CalendarView(holidaysDict: $viewModel.holidaysDict)
                .padding(.horizontal, 16)
        }
        .stBackground()
    }
}
