import SwiftUI
import DesignSystem

public struct FindEmployeeIDView: View {
    @StateObject var viewModel: FindEmployeeIDViewModel
    @State var isPresentedSpotList = false
    let employeeIDSpotListComponent: EmployeeIDSpotListComponent

    public init(
        viewModel: FindEmployeeIDViewModel,
        employeeIDSpotListComponent: EmployeeIDSpotListComponent
    ) {
        _viewModel = StateObject(wrappedValue: viewModel)
        self.employeeIDSpotListComponent = employeeIDSpotListComponent
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
            .onTapGesture {
                isPresentedSpotList.toggle()
            }

            CTAButton(text: "확인") {
                
            }
            .padding(.top, 32)

            Spacer()
        }
        .padding(.horizontal, 16)
        .sheet(isPresented: $isPresentedSpotList) {
            employeeIDSpotListComponent.makeView { spot in
                viewModel.spot = spot
            }
        }
    }
}
