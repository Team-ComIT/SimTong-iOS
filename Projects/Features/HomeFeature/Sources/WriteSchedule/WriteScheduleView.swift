import DesignSystem
import DomainModule
import SwiftUI

struct WriteScheduleView: View {
    @StateObject var viewModel: WriteScheduleViewModel
    @Environment(\.dismiss) var dismiss
    @Binding var isPresented: Bool
    var scheduleAnimation: Namespace.ID
    let onFinished: (
        [String: HolidayType],
        [String: [ScheduleEntity]]
    ) -> Void

    init(
        viewModel: WriteScheduleViewModel,
        isPresented: Binding<Bool>,
        scheduleAnimation: Namespace.ID,
        onFinished: @escaping (
            [String: HolidayType],
            [String: [ScheduleEntity]]
        ) -> Void
    ) {
        _viewModel = StateObject(wrappedValue: viewModel)
        _isPresented = isPresented
        self.scheduleAnimation = scheduleAnimation
        self.onFinished = onFinished
    }

    var body: some View {
        ScrollView {
            VStack {
                if isPresented {
                    CalendarView(
                        holidaysDict: $viewModel.holidaysDict,
                        scheduleDict: $viewModel.scheduleDict
                    ) { date in
                        viewModel.selectedDate = date
                    }
                    .matchedGeometryEffect(id: "SCHEDULE", in: scheduleAnimation)
                    .padding(.top, 8)
                }
            }
            .padding(.top, 12)
            .padding(.horizontal, 16)
        }
        .navigationTitle(isPresented ? "일정 작성" : "")
        .navigationBarTitleDisplayMode(.inline)
        .toolbar {
            ToolbarItemGroup(placement: .navigationBarLeading) {
                Button {
                    withAnimation(.spring()) {
                        isPresented = false
                    }
                } label: {
                    Image(systemName: "chevron.left")
                        .resizable()
                        .frame(width: 9, height: 16)
                        .foregroundColor(.grayMain)
                }
            }
        }
        .onDisappear {
            onFinished(viewModel.holidaysDict, viewModel.scheduleDict)
        }
        .stBackground()
    }

    @ViewBuilder
    func navigationBarView() -> some View {
        ZStack {
            HStack {
                Image(systemName: "chevron.left")
                    .resizable()
                    .frame(width: 9, height: 16)
                    .onTapGesture {
                        withAnimation(.spring()) {
                            isPresented = false
                        }
                    }

                Spacer()
            }

            Text("휴무표 작성")
                .stTypo(.r5, color: .grayMain)
        }
        .frame(maxWidth: .infinity)
        .padding(.horizontal, 16)
    }
}
