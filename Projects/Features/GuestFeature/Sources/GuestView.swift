import DesignSystem
import SwiftUI

struct GuestView: View {
    @StateObject var viewModel: GuestViewModel

    init(
        viewModel: GuestViewModel
    ) {
        _viewModel = StateObject(wrappedValue: viewModel)
    }

    var body: some View {
        Text("Text")
    }
}
