import SwiftUI

public struct STCheckbox: View {
    public init(isOn: Binding<Bool>) {
        self._isOn = isOn
    }

    @Binding var isOn: Bool
    public var body: some View {
        Toggle("", isOn: $isOn)
            .toggleStyle(STCheckboxStyle())
            .onTapGesture {
                isOn.toggle()
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
