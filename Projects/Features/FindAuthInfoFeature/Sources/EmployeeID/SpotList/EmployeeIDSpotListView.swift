import SwiftUI

public struct EmployeeIDSpotListView: View {
    @StateObject var viewModel: EmployeeIDSpotListViewModel
    private let completion: () -> String

    public init(
        viewModel: EmployeeIDSpotListViewModel,
        completion: @escaping () -> String
    ) {
        _viewModel = StateObject(wrappedValue: viewModel)
        self.completion = completion
    }

    public var body: some View {
        Text("Hello, World!")
    }
}
