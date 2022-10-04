import SwiftUI
import DesignSystem

public struct FindEmployeeIDView: View {
    @StateObject var viewModel: FindEmployeeIDViewModel

    public init(viewModel: FindEmployeeIDViewModel) {
        _viewModel = StateObject(wrappedValue: viewModel)
    }

    public var body: some View {
        VStack(spacing: 8) {
            STTextField("이름을 입력해주세요", text: $viewModel.name)
                .padding(.top, 64)

            STTextField("E-mail을 입력해주세요", text: $viewModel.email)

            Group {
                STTextField("근무지점을 선택해주세요", text: $viewModel.spot)
                    .disabled(true)
            }

            Spacer()
        }
        .padding(.horizontal, 16)
    }
}
