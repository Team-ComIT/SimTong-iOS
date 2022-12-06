import BaseFeature
import Combine
import DomainModule
import Foundation
import Utility

final class ComposeScheduleViewModel: BaseViewModel {
    @Published var title: String = ""
    @Published var startAt = Date() {
        didSet {
            startAtString = dateFormattingString(date: startAt)
            if startAt.compare(endAt) == .orderedDescending { endAt = startAt }
        }
    }
    @Published var endAt = Date() {
        didSet { endAtString = dateFormattingString(date: endAt) }
    }
    @Published var alarmTime = Date() {
        didSet { alarmTimeString = timeFormattingString(date: alarmTime) }
    }
    @Published var startAtString = "\(Date().year)년 \(Date().month)월 \(Date().day)일"
    @Published var endAtString = "\(Date().year)년 \(Date().month)월 \(Date().day)일"
    @Published var alarmTimeString = ""
    @Published var isPresentedStartAtDatePicker = false
    @Published var isPresentedEndAtDatePicker = false
    @Published var isPresentedAlarmDatePicker = false
    let isUpdate: Bool
    private let id: String
    private let createNewScheduleUseCase: any CreateNewScheduleUseCase
    private let updateScheduleUseCase: any UpdateScheduleUseCase

    init(
        updateTarget: ScheduleEntity? = nil,
        createNewScheduleUseCase: any CreateNewScheduleUseCase,
        updateScheduleUseCase: any UpdateScheduleUseCase
    ) {
        self.createNewScheduleUseCase = createNewScheduleUseCase
        self.updateScheduleUseCase = updateScheduleUseCase
        if let updateTarget {
            isUpdate = true
            id = updateTarget.id
            title = updateTarget.title
            startAt = updateTarget.startAt.toSmallSimtongDate()
            endAt = updateTarget.endAt.toSmallSimtongDate()
            super.init()
            startAtString = dateFormattingString(date: startAt)
            endAtString = dateFormattingString(date: endAt)
        } else {
            id = ""
            isUpdate = false
            super.init()
        }
    }

    func dateFormattingString(date: Date) -> String {
        let formatter = DateFormatter()
        formatter.dateFormat = "yyyy년 MM월 d일"
        formatter.locale = Locale(identifier: "ko_kr")
        return formatter.string(from: date)
    }
    func timeFormattingString(date: Date) -> String {
        let formatter = DateFormatter()
        formatter.dateFormat = "a HH시 mm분"
        formatter.amSymbol = "오전"
        formatter.pmSymbol = "오후"
        formatter.locale = Locale(identifier: "ko_kr")
        return formatter.string(from: date)
    }
}
