// swiftlint: disable all
import SwiftUI
import UIKit

extension CustomTextField {
    enum Style {
        case `default`, button
    }
    enum state {
        case disabled, enabled
    }
}

struct CustomTextFieldStyle: TextFieldStyle {

    @Binding var text: String
    @Binding var placeholderText: String

    var style: CustomTextField.Style
    var state: CustomTextField.state

    func _body(configuration: TextField<Self._Label>) -> some View {
        switch state {
        case .disabled:
            return ZStack {
                configuration
                    .modifier(
                        PlaceholderStyle(
                            showPlaceHolder: text.isEmpty,
                            placeholder: placeholderText,
                            foregroundColor: .gray04
                        ))
                    .background(Color.gray02)
            }
        case .enabled:
            return ZStack {
                configuration
                    .modifier(
                        PlaceholderStyle(
                            showPlaceHolder: text.isEmpty,
                            placeholder: placeholderText,
                            foregroundColor: .gray09
                        ))
                    .background(Color.gray01)
            }
        }
    }
}
