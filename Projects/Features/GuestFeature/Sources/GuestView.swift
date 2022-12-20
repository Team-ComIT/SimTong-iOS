import BaseFeature
import Combine
import DesignSystem
import DomainModule
import SwiftUI
import Utility

struct GuestView: View {
    @EnvironmentObject var appState: AppState
    @StateObject var viewModel: GuestViewModel
    private let columns: [GridItem] = Array(repeating: .init(.flexible()), count: 2)
    private let timer = Timer.publish(every: 3, on: .main, in: .common) .autoconnect()

    init(
        viewModel: GuestViewModel
    ) {
        _viewModel = StateObject(wrappedValue: viewModel)
    }

    var body: some View {
        GeometryReader { proxy in
            ScrollView(.vertical) {
                VStack {
                    TabView(selection: $viewModel.imageSlideSelection) {
                        STImage(.sungsimdangIntroduce)
                            .tag(0)

                        Link(
                            destination: URL(string: "https://www.facebook.com/sungsimdang4114") ??
                            URL(string: "https://www.google.com")!
                        ) {
                            STImage(.sungsimdangFacebook)
                        }
                        .tag(1)
                    }
                    .tabViewStyle(.page)
                    .frame(maxWidth: .infinity)
                    .frame(height: proxy.size.width * 0.5333)
                    .onReceive(timer) { _ in
                        withAnimation {
                            viewModel.imageSlideSelection =  viewModel.imageSlideSelection == 0 ? 1 : 0
                        }
                    }

                    VStack(spacing: 12) {
                        HStack {
                            Text("본점 식당 메뉴")
                                .stTypo(.s5, color: .extraBlack)

                            Spacer()
                        }

                        ScrollView(.horizontal, showsIndicators: false) {
                            LazyHStack(spacing: 8) {
                                ForEach(viewModel.menus, id: \.date) { menu in
                                    menuColumnView(menu: menu)
                                }
                            }
                        }
                    }
                    .padding(.horizontal, 16)

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
                                Button {
                                    viewModel.selectedURL = bread.2
                                    viewModel.isPresentedBread = true
                                } label: {
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
            .fullScreenCover(isPresented: $viewModel.isPresentedBread) {
                STSafariView(url: URL(string: viewModel.selectedURL ?? ""))
                    .ignoresSafeArea()
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
                        Image(systemName: "person.fill")
                            .foregroundColor(.grayMain)
                    }
                }
            }
            .onAppear {
                viewModel.onAppear()
            }
        }
    }

    @ViewBuilder
    func menuColumnView(menu: MenuEntity) -> some View {
        VStack(alignment: .leading) {
            HStack {
                VStack(alignment: .leading, spacing: 8) {
                    Text("\(menu.date.toSmallSimtongDate().month)월 \(menu.date.toSmallSimtongDate().day)일")
                        .stTypo(.r7, color: .extraBlack)
                        .padding(.bottom, 8)

                    ForEach(menu.meal, id: \.self) { meal in
                        Text(meal)
                            .stTypo(.m5, color: .grayMain)
                            .frame(maxHeight: .infinity)
                    }
                }

                Spacer()
            }
            .padding(20)
        }
        .frame(width: 168, height: 272)
        .background {
            STImage(.rice, renderingMode: .original)
        }
        .cornerRadius(16)
    }
}
