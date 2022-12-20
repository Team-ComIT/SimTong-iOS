import SwiftUI
import SafariServices

public struct STSafariView: UIViewControllerRepresentable {
    public typealias UIViewControllerType = SFSafariViewController

    var url: URL?

    public init(url: URL?) {
        self.url = url
    }

    public func makeUIViewController(
        context: UIViewControllerRepresentableContext<STSafariView>
    ) -> SFSafariViewController {
        return SFSafariViewController(url: url ?? URL(string: "https://www.google.com")!)
    }

    public func updateUIViewController(
        _ safariViewController: SFSafariViewController,
        context: UIViewControllerRepresentableContext<STSafariView>
    ) {}
}
