import Combine
import ErrorModule

public protocol ReissueTokenUseCase {
    func execute() async throws
}
