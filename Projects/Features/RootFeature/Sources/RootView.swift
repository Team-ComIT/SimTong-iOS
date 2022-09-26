import SwiftUI

public struct RootView: View {
    @StateObject var viewModel: RootViewModel

    public var body: some View {
        Text("Hello, World!")
    }
}

struct RootView_Previews: PreviewProvider {
    static var previews: some View {
        RootView(viewModel: RootViewModel())
    }
}
