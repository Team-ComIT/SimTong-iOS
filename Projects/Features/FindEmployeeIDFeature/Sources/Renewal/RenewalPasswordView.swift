import SwiftUI

struct RenewalPasswordView: View {
    @StateObject var viewModel: RenewalPasswordViewModel

    public init(
        viewModel: RenewalPasswordViewModel
    ) {
        _viewModel = StateObject(wrappedValue: viewModel)
    }

    var body: some View {
        Text("Hello, World!")
    }
}
