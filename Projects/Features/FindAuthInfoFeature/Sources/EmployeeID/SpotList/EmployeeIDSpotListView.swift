import SwiftUI
import DomainModule
import DesignSystem

public struct EmployeeIDSpotListView: View {
    @Environment(\.dismiss) var dismiss
    @StateObject var viewModel: EmployeeIDSpotListViewModel
    private let completion: (Spot) -> Void

    public init(
        viewModel: EmployeeIDSpotListViewModel,
        completion: @escaping (Spot) -> Void
    ) {
        _viewModel = StateObject(wrappedValue: viewModel)
        self.completion = completion
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
                                completion(spot)
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
                        .stTypo(.m5, color: .gray09)
                    
                    Text(spot.location)
                        .stTypo(.r6, color: .gray04)
                }
                .multilineTextAlignment(.center)
            }

            Spacer()

            STRadioButton(isChecked: viewModel.selectedSpot == spot) {
                completion(spot)
                dismiss()
            }
        }
    }
}
