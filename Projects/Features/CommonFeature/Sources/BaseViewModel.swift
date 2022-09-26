import Combine

open class BaseViewModel: ObservableObject {
    @Published public var isError = false
    @Published public var isLoading = false
    @Published public var errorMessage = ""

    
}
