import NeedleFoundation
import DomainModule
import DataModule

// MARK: - Commons
extension AppComponent {
    public var fetchSpotListUseCase: any FetchSpotListUseCase {
        FetchSpotListUseCaseStub()
    }

    public var findEmployeeNumberUseCase: any FindEmployeeNumberUseCase {
        FindEmployeeNumberUseCaseImpl(commonRepository: commonsRepository)
    }
}

// MARK: - Files
extension AppComponent {
    public var uploadSingleFileUseCase: any UploadSingleFileUseCase {
        UploadSingleFileUseCaseImpl(filesRepository: filesRepository)
    }

    public var uploadMultipleFileUseCase: any UploadMultipleFileUseCase {
        UploadMultipleFileUseCaseImpl(filesRepository: filesRepository)
    }
}
