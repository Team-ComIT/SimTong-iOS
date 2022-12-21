import DomainModule
import NeedleFoundation
import SwiftUI

public protocol WriteHolidayDependency: Dependency {
    var fetchHolidayUseCase: any FetchHolidayUseCase { get }
    var setHolidayUseCase: any SetHolidayUseCase { get }
    var setAnnualUseCase: any SetAnnualUseCase { get }
    var setWorkUseCase: any SetWorkUseCase { get }
    var fetchAnnualCountUseCase: any FetchAnnualCountUseCase { get }
}

public final class WriteHolidayComponent: Component<WriteHolidayDependency> {
    public func makeView(
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
                scheduleDict: scheduleDict,
                fetchHolidayUseCase: dependency.fetchHolidayUseCase,
                setHolidayUseCase: dependency.setHolidayUseCase,
                setAnnualUseCase: dependency.setAnnualUseCase,
                setWorkUseCase: dependency.setWorkUseCase,
                fetchAnnualCountUseCase: dependency.fetchAnnualCountUseCase
            ),
            isPresented: isPresented,
            calendarAnimation: calendarAnimation,
            onFinished: onFinished
        )
    }
}
