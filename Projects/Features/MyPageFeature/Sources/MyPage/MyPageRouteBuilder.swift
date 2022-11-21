import Combine

final class MyPageRouteBuilder: ObservableObject {
    @Published var routeBuilder = false
    var bag = Set<AnyCancellable>()
}
