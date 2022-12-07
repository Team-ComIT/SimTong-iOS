import DomainModule
import NeedleFoundation
import SwiftUI

public protocol WriteHolidayDependency: Dependency {
    var fetchHolidayUseCase: any FetchHolidayUseCase { get }
    var setHolidayUseCase: any SetHolidayUseCase { get }
    var setAnnualUseCase: any SetAnnualUseCase { get }
    var setWorkUseCase: any SetWorkUseCase { get }
}

public final class WriteHolidayComponent: Component<WriteHolidayDependency> {
    public func makeView(
        holidaysDict: [String: HolidayType],
        scheduleDict: [String: [ScheduleEntity]],
        isPresented: Binding<Bool>,
        calendarAnimation: Namespace.ID,
        onFinished: @escaping (
            [String: HolidayType],
            [String: [ScheduleEntity]]
        ) -> Void
    ) -> some View {
        WriteHolidayView(
            viewModel: .init(
                holidaysDict: holidaysDict,
                scheduleDict: scheduleDict,
                fetchHolidayUseCase: dependency.fetchHolidayUseCase,
                setHolidayUseCase: dependency.setHolidayUseCase,
                setAnnualUseCase: dependency.setAnnualUseCase,
                setWorkUseCase: dependency.setWorkUseCase
            ),
            isPresented: isPresented,
            calendarAnimation: calendarAnimation,
            onFinished: onFinished
        )
    }
}
