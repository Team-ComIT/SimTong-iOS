import SwiftUI

public struct STCheckbox: View {
    @Binding var isOn: Bool
    let willChange: (Bool) -> Void
    let didChange: (Bool) -> Void

    public init(
        isOn: Binding<Bool>,
        willChange: @escaping (Bool) -> Void = { _ in },
        didChange: @escaping (Bool) -> Void = { _ in }
    ) {
        _isOn = isOn
        self.willChange = willChange
        self.didChange = didChange
    }

    public var body: some View {
        Toggle("", isOn: $isOn)
            .toggleStyle(STCheckboxStyle())
            .animation(.easeInOut, value: isOn)
            .onTapGesture {
                willChange(isOn)
                withAnimation {
                    isOn.toggle()
                }
                didChange(isOn)
            }
    }
}

public struct STCheckbox_Previews: PreviewProvider {
    public static var previews: some View {
        HStack(spacing: 15) {
            STCheckbox(isOn: .constant(true))
            STCheckbox(isOn: .constant(false))
        }
    }
}
