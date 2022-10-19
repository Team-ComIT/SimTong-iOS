import SwiftUI

struct FindPasswordVerifyVIew: View {
    @StateObject var viewModel: FindPasswordVerifyViewModel

    public init(
        viewModel: FindPasswordVerifyViewModel
    ) {
        self.viewModel = viewModel
    }

    var body: some View {
        Text("Hello, World!")
    }
}

struct FindPasswordVerifyVIew_Previews: PreviewProvider {
    static var previews: some View {
        FindPasswordVerifyVIew()
    }
}
