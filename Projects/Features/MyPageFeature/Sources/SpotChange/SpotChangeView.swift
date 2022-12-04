import SwiftUI
import DomainModule
import DesignSystem

struct SpotChangeView: View {
    @Environment(\.dismiss) var dismiss
    @StateObject var viewModel: SpotChangeViewModel

    init(
        viewModel: SpotChangeViewModel
    ) {
        _viewModel = StateObject(wrappedValue: viewModel)
    }

    var body: some View {
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
                            }
                            .overlay(alignment: .bottom) {
                                Divider()
                                    .foregroundColor(.gray02)
                                    .frame(height: 0.5)
                                    .padding(.horizontal, 16)
                            }
                    }
                }
                .configBackButton(dismiss: dismiss)
                .navigationTitle("지점선택")
                .navigationBarTitleDisplayMode(.inline)
                .toolbar {
                    ToolbarItemGroup(placement: .navigationBarTrailing) {
                        Button {
                            Task {
                                await viewModel.changeSpot()
                            }
                            dismiss()
                        } label: {
                            Text("저장")
                                .stTypo(.m6, color: viewModel.saveButtonDisable ? .main : .main02)
                        }
                        .disabled(!viewModel.saveButtonDisable)
                    }
                }
                .task {
                    await viewModel.onAppear()
                }

                Spacer()
            }
            .padding(.top, 32)
        }
    }

    @ViewBuilder
    func spotItemView(spot: SpotEntity) -> some View {
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
            }
        }
    }
}
