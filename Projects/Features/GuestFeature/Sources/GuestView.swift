import BaseFeature
import DesignSystem
import SwiftUI

struct GuestView: View {
    @EnvironmentObject var appState: AppState
    @StateObject var viewModel: GuestViewModel
    private let columns: [GridItem] = Array(repeating: .init(.flexible()), count: 2)

    init(
        viewModel: GuestViewModel
    ) {
        _viewModel = StateObject(wrappedValue: viewModel)
    }

    var body: some View {
        GeometryReader { proxy in
            ScrollView(.vertical) {
                VStack {
                    Link(
                        destination: URL(string: "https://www.facebook.com/sungsimdang4114") ??
                        URL(string: "https://www.google.com")!
                    ) {
                        STImage(.sungsimdangFacebook)
                            .frame(maxWidth: .infinity)
                            .frame(height: proxy.size.width * 0.5333)
                    }

                    VStack(spacing: 12) {
                        HStack {
                            Text("성심당 특산품")
                                .stTypo(.s5, color: .extraBlack)

                            Spacer()

                            Link(
                                destination: URL(string: "https://www.sungsimdangmall.co.kr") ??
                                URL(string: "https://www.google.com")!
                            ) {
                                HStack(spacing: 4) {
                                    Text("전체보기")
                                        .stTypo(.r7, color: .gray04)

                                    Image(systemName: "chevron.right")
                                        .foregroundColor(.gray04)
                                }
                            }
                        }

                        LazyVGrid(columns: columns) {
                            ForEach(viewModel.specialtiesList, id: \.0) { bread in
                                Link(
                                    destination: URL(string: bread.2) ??
                                    URL(string: "https://www.google.com")!
                                ) {
                                    VStack(spacing: 4) {
                                        AsyncImage(url: URL(string: bread.1)) { image in
                                            image.resizable()
                                        } placeholder: {
                                            Color.gray04
                                        }
                                        .frame(width: proxy.size.width * 0.4426, height: proxy.size.width * 0.4426)
                                        .cornerRadius(8)

                                        Text(bread.0)
                                            .stTypo(.r6, color: .grayMain)
                                    }
                                }
                            }
                        }
                    }
                    .padding(.top, 32)
                    .padding(.horizontal, 16)
                }
            }
            .toolbar {
                ToolbarItem(placement: .navigationBarLeading) {
                    STImage(.sungsimdang)
                        .frame(width: 90, height: 29)
                }
                ToolbarItem(placement: .navigationBarTrailing) {
                    Button {
                        withAnimation {
                            appState.sceneFlow = .intro
                        }
                    } label: {
                        Image(systemName: "rectangle.portrait.and.arrow.right")
                            .foregroundColor(.grayMain)
                    }
                }
            }
        }
    }
}
