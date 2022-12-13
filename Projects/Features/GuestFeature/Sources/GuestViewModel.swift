import BaseFeature
import Combine

// swiftlint: disable large_tuple
final class GuestViewModel: BaseViewModel {
    @Published var specialtiesList: [(String, String, String)] = [
        (
            "튀소세트",
            "https://www.sungsimdangmall.co.kr/data/sungsimdang/goods/sungsimdang/big/IMG05.png",
            "https://www.sungsimdangmall.co.kr/product/content.asp?guid=523157"
        ),
        (
            "초코튀소삼형제",
            "https://www.sungsimdangmall.co.kr/data/sungsimdang/goods/sungsimdang/big/초코튀소삼형제.jpg",
            "https://www.sungsimdangmall.co.kr/product/content.asp?guid=523295"
        ),
        (
            "반반세트",
            "https://www.sungsimdangmall.co.kr/data/sungsimdang/goods/sungsimdang/big/IMG09.png",
            "https://www.sungsimdangmall.co.kr/product/content.asp?guid=523113"
        ),
        (
            "형제세트",
            "https://www.sungsimdangmall.co.kr/data/sungsimdang/goods/sungsimdang/big/IMG08.png",
            "https://www.sungsimdangmall.co.kr/product/content.asp?guid=523124"
        )
    ]
    @Published var imageSlideSelection = 0
    @Published var selectedURL: String?
    @Published var isPresentedBread = false
}
