import SwiftUI

public struct EmployeeIDSpotListView: View {
    @StateObject var viewModel: EmployeeIDSpotListViewModel
    private let completion: (String) -> Void

    public init(
        viewModel: EmployeeIDSpotListViewModel,
        completion: @escaping (String) -> Void
    ) {
        _viewModel = StateObject(wrappedValue: viewModel)
        self.completion = completion
    }

    public var body: some View {
        NavigationView {
            LazyVStack {
                
            }
            .navigationTitle("지점선택")
            .navigationBarTitleDisplayMode(.inline)
        }
    }

    @ViewBuilder
    func spotItemView() -> some View {
        HStack {
            
        }
    }
}
