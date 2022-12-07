import SwiftUI

public extension View {
    func navigate<NewView: View>(
        to view: NewView,
        when binding: Binding<Bool>,
        isDetailLink: Bool = false
    ) -> some View {
        if #available(iOS 16.0, *) {
            return self.navigationDestination(isPresented: binding) {
                view
            }
        } else {
            return self.background {
                NavigationLink(isActive: binding) {
                    DeferView {
                        view
                    }
                } label: {
                    EmptyView()
                }
                .isDetailLink(isDetailLink)
            }
        }
    }
}

public struct DeferView<Content: View>: View {
    let content: () -> Content

    public init(
        @ViewBuilder _ content: @escaping () -> Content
    ) {
        self.content = content
    }

    public var body: some View {
        content()
    }
}
