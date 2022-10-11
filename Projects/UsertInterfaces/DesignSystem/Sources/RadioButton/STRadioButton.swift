import SwiftUI

public struct STRadioButton: View {
    var isChecked: Bool
    var action: () -> Void

    public init(
        isChecked: Bool = false,
        action: @escaping () -> Void = {}
    ) {
        self.isChecked = isChecked
        self.action = action
    }

    public var body: some View {
        isChecked ?
        AnyView(CheckedSTRadioButton(action: action)) :
        AnyView(UnCheckedSTRadioButton(action: action))
    }
}

private struct CheckedSTRadioButton: View {
    var action: () -> Void

    var body: some View {
        ZStack {
            Circle()
                .fill(Color.mainMain)
                .frame(width: 10, height: 10)
            Circle()
                .fill(Color.clear)
                .frame(width: 20, height: 20)
                .overlay(
                    Circle()
                        .stroke(Color.mainMain, lineWidth: 1.72)
                )
        }.onTapGesture(perform: action)
    }
}

private struct UnCheckedSTRadioButton: View {
    var action: () -> Void

    var body: some View {
        Circle()
            .fill(Color.clear)
            .frame(width: 20, height: 20)
            .overlay(
                Circle()
                    .stroke(Color.gray03, lineWidth: 1.72)
            )
            .onTapGesture(perform: action)
    }
}
