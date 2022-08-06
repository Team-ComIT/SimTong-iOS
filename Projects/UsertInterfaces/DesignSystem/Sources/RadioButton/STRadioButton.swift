import SwiftUI

public struct STRadioButton: View {
    var isChecked: Bool
    var action: () -> Void

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
                .fill(Color.main05)
                .frame(width: 10, height: 10)
            Circle()
                .fill(Color.clear)
                .frame(width: 20, height: 20)
                .overlay(
                    Circle()
                        .stroke(Color.main05, lineWidth: 1.72)
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
