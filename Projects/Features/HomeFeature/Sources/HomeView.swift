import DesignSystem
import DomainModule
import SwiftUI

struct HomeView: View {
    @StateObject var viewModel: HomeViewModel

    public init(viewModel: HomeViewModel) {
        _viewModel = StateObject(wrappedValue: viewModel)
    }

    var body: some View {
        ScrollView(showsIndicators: false) {
            VStack(alignment: .leading, spacing: 8) {
                HStack(spacing: 12) {
                    Text("캘린더")
                        .stTypo(.r3, color: .extraBlack)

                    Image(systemName: "chevron.right")
                        .foregroundColor(.extraBlack)
                }

                CalendarView(holidaysDict: $viewModel.holidaysDict)

                Text("직원 식당 메뉴")
                    .stTypo(.r4, color: .extraBlack)
                    .padding(.top, 32)
            }
            .padding(.horizontal, 16)
        }
        .stBackground()
    }

    @ViewBuilder
    func menuColumnView() -> some View {
        VStack {
            
        }
        .frame(height: 272)
    }
}
