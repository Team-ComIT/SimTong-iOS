import DesignSystem
import SwiftUI
import Utility

struct ComposeScheduleView: View {
    private enum FocusField {
        case title
    }
    @StateObject var viewModel: ComposeScheduleViewModel
    @Environment(\.dismiss) var dismiss
    @FocusState private var focusField: FocusField?

    init(
        viewModel: ComposeScheduleViewModel
    ) {
        _viewModel = StateObject(wrappedValue: viewModel)
    }

    var body: some View {
        VStack(spacing: 4) {
            STTextField(
                "일정 제목을 입력해주세요.",
                labelText: "제목",
                text: $viewModel.title,
                onCommit: {
                }
            )
            .focused($focusField, equals: .title)
            .padding(.top, 32)

            VStack {
                let today = Date()
                STTextField(
                    "\(today.year)년 \(today.month)월 \(today.day)일",
                    labelText: "날짜",
                    text: $viewModel.startAtString
                )
                .disabled(true)
            }
            .padding(.top, 24)
            .onTapGesture {
                viewModel.isPresentedStartAtDatePicker = true
            }

            VStack {
                let today = Date()
                STTextField(
                    "\(today.year)년 \(today.month)월 \(today.day)일",
                    text: $viewModel.endAtString
                )
                .disabled(true)
            }
            .onTapGesture {
                viewModel.isPresentedEndAtDatePicker = true
            }

            VStack {
                STTextField(
                    "몇시에 일정을 알려드릴까요?",
                    labelText: "알림",
                    text: $viewModel.alarmTimeString
                )
                .disabled(true)
            }
            .padding(.top, 24)
            .onTapGesture {
                viewModel.isPresentedAlarmDatePicker = true
            }

            Spacer()

            CTAButton(text: "추가")
                .padding(.bottom, 16)
        }
        .padding(.horizontal, 16)
        .stBackground()
        .bottomSheet(isShowing: $viewModel.isPresentedStartAtDatePicker) {
            DatePicker("", selection: $viewModel.startAt, in: Date()..., displayedComponents: [.date])
                .datePickerStyle(.graphical)
                .padding()
                .accentColor(.main)
        }
        .bottomSheet(isShowing: $viewModel.isPresentedEndAtDatePicker) {
            DatePicker("", selection: $viewModel.endAt, in: viewModel.startAt..., displayedComponents: [.date])
                .datePickerStyle(.graphical)
                .padding()
                .accentColor(.main)
        }
        .bottomSheet(isShowing: $viewModel.isPresentedAlarmDatePicker) {
            DatePicker("", selection: $viewModel.alarmTime, displayedComponents: [.hourAndMinute])
                .datePickerStyle(.wheel)
                .labelsHidden()
                .padding()
                .accentColor(.main)
        }
        .toolbar {
            ToolbarItem(placement: .principal) {
                Text(viewModel.isUpdate ? "일정 수정" : "일정 추가")
                    .font(.headline)
            }
        }
        .configBackButton(dismiss: dismiss)
    }
}
