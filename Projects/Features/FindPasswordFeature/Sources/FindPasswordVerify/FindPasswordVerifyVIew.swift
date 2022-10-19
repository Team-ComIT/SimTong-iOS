import SwiftUI

struct FindPasswordVerifyVIew: View {
    @StateObject var viewModel: FindPasswordVerifyViewModel

    public init(
        viewModel: FindPasswordVerifyViewModel
    ) {
        _viewModel = viewModel
    }

    var body: some View {
        Text("Hello, World!")
    }
}
