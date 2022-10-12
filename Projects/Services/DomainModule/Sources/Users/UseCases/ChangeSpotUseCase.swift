public protocol ChangeSpotUseCase {
    func execute(spotID: String) async throws
}
