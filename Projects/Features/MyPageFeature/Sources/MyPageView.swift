import SwiftUI

struct MyPageView: View {
    @StateObject var viewModel: MyPageViewModel

    public init(
        viewModel: MyPageViewModel
    ) {
        _viewModel = StateObject(wrappedValue: viewModel)
    }

    var body: some View {
        Text("Hello, World!")
    }
}

struct MyPageView_Previews: PreviewProvider {
    static var previews: some View {
        MyPageView()
    }
}
