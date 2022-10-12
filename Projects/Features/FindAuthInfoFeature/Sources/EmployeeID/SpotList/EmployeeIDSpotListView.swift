import SwiftUI
import DomainModule
import DesignSystem

public struct EmployeeIDSpotListView: View {
    @Environment(\.dismiss) var dismiss
    @StateObject var viewModel: EmployeeIDSpotListViewModel

    public init(
        viewModel: EmployeeIDSpotListViewModel
    ) {
        _viewModel = StateObject(wrappedValue: viewModel)
    }

    public var body: some View {
        NavigationView {
            VStack {
                LazyVStack {
                    ForEach(viewModel.spotList, id: \.id) { spot in
                        spotItemView(spot: spot)
                            .background(Color.extraWhite)
                            .padding(.horizontal, 16)
                            .padding(.top, 8)
                            .padding(.bottom, 16)
                            .onTapGesture {
                                viewModel.spotDidTap(spot: spot)
                                dismiss()
                            }
                            .overlay(alignment: .bottom) {
                                Divider()
                                    .foregroundColor(.gray02)
                                    .frame(height: 0.5)
                                    .padding(.horizontal, 16)
                            }
                    }
                }
                .navigationTitle("지점선택")
                .navigationBarTitleDisplayMode(.inline)
                .task {
                    await viewModel.onAppear()
                }

                Spacer()
            }
            .padding(.top, 32)
        }
    }

    @ViewBuilder
    func spotItemView(spot: Spot) -> some View {
        HStack(alignment: .center) {
            VStack(alignment: .leading, spacing: 6) {
                Group {
                    Text(spot.name)
                        .stTypo(.m5, color: .grayMain)

                    Text(spot.location)
                        .stTypo(.r6, color: .gray04)
                }
                .multilineTextAlignment(.center)
            }

            Spacer()

            STRadioButton(isChecked: viewModel.selectedSpot == spot) {
                viewModel.spotDidTap(spot: spot)
                dismiss()
            }
        }
    }
}
