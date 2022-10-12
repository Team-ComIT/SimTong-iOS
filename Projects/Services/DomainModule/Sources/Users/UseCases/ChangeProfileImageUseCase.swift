public protocol ChangeProfileImageUseCase {
    func execute(imageURL: String) async throws
}
