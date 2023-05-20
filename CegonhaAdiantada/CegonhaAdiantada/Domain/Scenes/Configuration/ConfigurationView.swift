//
//  ConfigurationView.swift
//  CegonhaAdiantada
//
//  Created by Arthur Givigir on 02/05/23.
//  
//
import SwiftUI
import InfiniteLoop

protocol ConfigurationDisplayLogic {
    func display(viewModel: Configuration.LoadConfiguration.ViewModel)
}

extension ConfigurationView: ConfigurationDisplayLogic {
    func display(viewModel: Configuration.LoadConfiguration.ViewModel) {}
    func fetch() {}
}

struct ConfigurationView: View {
    var interactor: ConfigurationBusinessLogic?
    
    @ObservedObject var Configuration = ConfigurationDataStore()
    
    init() {
        UINavigationBar.appearance().largeTitleTextAttributes = [
            .foregroundColor: UIColor(Colors.secondary.color)
        ]
        UINavigationBar.appearance().titleTextAttributes = [
            .foregroundColor: UIColor(Colors.secondary.color)
        ]
        UINavigationBar.appearance().barTintColor = .clear
        UINavigationBar.appearance().setBackgroundImage(UIImage(), for: .default)
        UINavigationBar.appearance().shadowImage = UIImage()
        
        UICollectionView.appearance().backgroundColor = .clear
    }
    
    var body: some View {
        NavigationView {
            ScrollWithBackgroundView(
                fillColor: Colors.secondary.color.opacity(0.1),
                lottieAnimation: .caringMom
            ) {
                VStack {
                    Spacer()
                        .frame(height: 100)
                    
                    VStack(alignment: .leading, spacing: Sizes.size02.cgFloat) {
                        VStack {
                            Text("Desenvolvedor:")
                                .foregroundColor(Colors.secondary.color)
                                .multilineTextAlignment(.leading)
                                .fixedSize(horizontal: false, vertical: true)
                                .font(
                                    .system(
                                        .title3,
                                        design: .rounded
                                    )
                                    .weight(.medium)
                                )
                            
                            Text("Arthur Gradim Givigir")
                                .foregroundColor(Colors.secondary.color)
                                .multilineTextAlignment(.leading)
                                .fixedSize(horizontal: false, vertical: true)
                                .font(
                                    .system(
                                        .body,
                                        design: .rounded
                                    )
                                    .weight(.light)
                                )
                            
                            
                            Spacer()
                                .frame(height: Sizes.size18.cgFloat)
                            
                            Text("Imagens e animações:")
                                .foregroundColor(Colors.secondary.color)
                                .multilineTextAlignment(.leading)
                                .fixedSize(horizontal: false, vertical: true)
                                .font(
                                    .system(
                                        .title3,
                                        design: .rounded
                                    )
                                    .weight(.medium)
                                )
                            
                            Text("Lottie")
                                .foregroundColor(Colors.secondary.color)
                                .multilineTextAlignment(.leading)
                                .fixedSize(horizontal: false, vertical: true)
                                .font(
                                    .system(
                                        .body,
                                        design: .rounded
                                    )
                                    .weight(.light)
                                )
                            
                            Text("Autores das animações:")
                                .foregroundColor(Colors.secondary.color)
                                .multilineTextAlignment(.leading)
                                .fixedSize(horizontal: false, vertical: true)
                                .font(
                                    .system(
                                        .title3,
                                        design: .rounded
                                    )
                                    .weight(.medium)
                                )
                            
                            Text("Md. Imam Hossain ")
                                .foregroundColor(Colors.secondary.color)
                                .multilineTextAlignment(.leading)
                                .fixedSize(horizontal: false, vertical: true)
                                .font(
                                    .system(
                                        .body,
                                        design: .rounded
                                    )
                                    .weight(.light)
                                )
                            
                            Text("Parsa Barati")
                                .foregroundColor(Colors.secondary.color)
                                .multilineTextAlignment(.leading)
                                .fixedSize(horizontal: false, vertical: true)
                                .font(
                                    .system(
                                        .body,
                                        design: .rounded
                                    )
                                    .weight(.light)
                                )
                            
                            Text("Ping Lu")
                                .foregroundColor(Colors.secondary.color)
                                .multilineTextAlignment(.leading)
                                .fixedSize(horizontal: false, vertical: true)
                                .font(
                                    .system(
                                        .body,
                                        design: .rounded
                                    )
                                    .weight(.light)
                                )
                            
                            LargeButton(
                                title: "Licença Lottie",
                                backgroundColor: Color.white,
                                foregroundColor: Colors.secondary.color
                            ) {
                                if let url = URL(string: "https://lottiefiles.com/page/license") {
                                    UIApplication.shared.open(url)
                                }
                            }
                        }
                        .padding(.vertical, Sizes.size16.cgFloat)
                        .padding(.horizontal, Sizes.size18.cgFloat)
                    }
                    .frame(maxWidth: .infinity)
                    .multilineTextAlignment(.leading)
                    .background {
                        RoundedRectangle(
                            cornerRadius: 10,
                            style: .continuous
                        )
                        .fill(.white)
                        .padding(.horizontal, Sizes.size10.cgFloat)
                    }
                    
                    Spacer()
                        .frame(height: 150)
                }
            }
            .edgesIgnoringSafeArea(.bottom)
            .navigationBarTitle(
                Text("Sobre")
            )
            .task {
                fetch()
            }
        }
    }
}

struct ConfigurationView_Previews: PreviewProvider {
    static var previews: some View {
        return ConfigurationView()
    }
}
