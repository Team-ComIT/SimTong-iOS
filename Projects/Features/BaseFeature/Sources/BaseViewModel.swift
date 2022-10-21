import Combine
import ErrorModule

open class BaseViewModel: ObservableObject {
    @Published public var isError = false
    @Published public var isLoading = false
    @Published public var errorMessage = ""

    public init() {}

    @MainActor
    public func withAsyncTry<Object: AnyObject>(
        with object: Object,
        action: @escaping (Object) async throws -> Void,
        errorAction: ((Object, STError) -> Void)? = nil
    ) async {
        isLoading = true
        do {
            try await action(object)
            isLoading = false
        } catch {
            if let errorAction = errorAction {
                errorAction(object, error.asSTError)
            } else {
                isError = true
                errorMessage = error.asSTError.localizedDescription
            }
            isLoading = false
        }
    }
}
