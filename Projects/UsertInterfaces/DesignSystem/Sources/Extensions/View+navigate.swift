import SwiftUI

public extension View {
    func navigate<NewView: View>(
        to view: NewView,
        when binding: Binding<Bool>,
        isDetailLink: Bool = false
    ) -> some View {
        self.background {
            NavigationLink(isActive: binding) {
                LinkPresenter(isPresented: binding) {
                    view
                }
            } label: {
                EmptyView()
            }
            .isDetailLink(isDetailLink)
        }
    }
}

struct LinkPresenter<Content: View>: View {
    let content: () -> Content

    @Binding var isPresented: Bool
    init(
        isPresented: Binding<Bool>,
        @ViewBuilder _ content: @escaping () -> Content
    ) {
        _isPresented = isPresented
        self.content = content
    }
    var body: some View {
        Group {
            if isPresented {
                EmptyView()
            } else {
                content()
            }
        }
    }
}
