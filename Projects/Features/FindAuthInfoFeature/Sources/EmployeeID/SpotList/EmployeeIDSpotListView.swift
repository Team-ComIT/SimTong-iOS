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
                        VStack(spacing: 16) {
                            spotItemView(spot: spot)

                            Divider()
                                .foregroundColor(.gray02)
                                .frame(height: 0.5)
                        }
                        .background(Color.extraWhite)
                        .padding(.horizontal, 16)
                        .padding(.top, 8)
                        .onTapGesture {
                            completion(spot)
                            dismiss()
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
                Text(spot.name)
                    .multilineTextAlignment(.leading)
                    .stTypo(.m5, color: .gray09)

                Text(spot.location)
                    .multilineTextAlignment(.leading)
                    .stTypo(.r6, color: .gray04)
            }

            Spacer()

            STRadioButton(isChecked: viewModel.selectedSpot == spot) {
                completion(spot)
                dismiss()
            }
        }
    }
}
