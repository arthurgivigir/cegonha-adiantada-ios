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
    func display(viewModel: ConfigurationModel.LoadConfiguration.ViewModel)
    func showThanks()
}

extension ConfigurationView: ConfigurationDisplayLogic {
    func showThanks() {
        DispatchQueue.main.async {
            thanksAlert.toggle()
        }
    }
    
    func display(viewModel: ViewModel) {
        DispatchQueue.main.async {
            configuration.coffees = viewModel.coffees
        }
    }
    
    func fetchTips() {
        interactor?.fetchTips(request: LoadRequest())
    }
}

struct ConfigurationView: View {
    typealias LoadRequest = ConfigurationModel.LoadConfiguration.Request
    typealias PurchaseRequest = ConfigurationModel.PurchaseTips.Request
    typealias ViewModel = ConfigurationModel.LoadConfiguration.ViewModel
    
    var interactor: ConfigurationBusinessLogic?
    
    @ObservedObject var configuration = ConfigurationDataStore()
    @State private var showPopUp = false
    @State private var thanksAlert = false
    
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
                            Text("Que tal apoiar o desenvolvedor?")
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
                            
                            Text("Pague um café para o desenvolvedor e ajude-o a continuar a desenvolver projetos como o Cegonha Adiantada 😉")
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
                            
                            LargeButton(
                                title: "Pague um Café ☕️",
                                backgroundColor: Color.white,
                                foregroundColor: Colors.secondary.color
                            ) {
                                showPopUp.toggle()
                            }
                        }
                        .padding(.vertical, Sizes.size16.cgFloat)
                        .padding(.horizontal, Sizes.size18.cgFloat)
                        
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
            .alert(isPresented: $thanksAlert) {
                Alert(
                    title: Text("Muito obrigado!"),
                    message: Text("Muito obrigado por apoiar o Cegonha Adiantada!"),
                    dismissButton: .default(Text("Valeu!"))
                )
            }
            .popup(isPresented: $showPopUp) {
                CoffeeView(coffees: configuration.coffees, delegate: self)
            } customize: {
                $0.closeOnTapOutside(true)
                    .closeOnTap(false)
                    .position(.top)
                    .animation(.easeInOut)
                    .isOpaque(true)
            }
            .task {
                fetchTips()
            }
        }
    }
}

extension ConfigurationView: CoffeeDelegate {
    func closePopUp() {
        showPopUp.toggle()
    }
    
    func purchase(coffee: Coffee) {
        showPopUp.toggle()
        interactor?.purchase(request: PurchaseRequest(coffee: coffee))
    }
}

struct ConfigurationView_Previews: PreviewProvider {
    static var previews: some View {
        return ConfigurationView()
    }
}

protocol CoffeeDelegate {
    func closePopUp()
    func purchase(coffee: Coffee)
}

struct CoffeeView: View {
    @State var coffees: [CoffeeProduct]
    let delegate: CoffeeDelegate
    
    var body: some View {
        VStack {
            ZStack {
                VStack {
                    Text("Escolha um dos cafés abaixo:")
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
                    
                    ForEach(coffees, id: \.price) { coffee in
                        LargeButton(
                            title: "\(coffee.title) - \(coffee.price)",
                            backgroundColor: Color.white,
                            foregroundColor: Colors.secondary.color
                        ) {
                            delegate.purchase(coffee: coffee.coffee)
                        }
                    }
                    
                    Text("Qualquer dúvida, ou problema, entre em contato com agivigir@gmail.com")
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
                    
                    HStack(spacing: 0.0) {
                        LargeButton(
                            title: "Fechar",
                            backgroundColor: Color.white,
                            foregroundColor: Colors.secondary.color
                        ) {
                            delegate.closePopUp()
                        }
                    }
                    .offset(y: 40)
                }
                .padding([.bottom, .leading, .trailing], .size12)
                .padding(.top, 20)
                .background(
                    GeometryReader { geometry in
                        Color.white
                            .cornerRadius(30)
                    }
                )
            }
            .padding(.all, .size12)
            .edgesIgnoringSafeArea([.top, .bottom])
            .frame(maxWidth: .infinity, maxHeight: .infinity)
            .background(Colors.secondary.color.opacity(0.5))
        }
    }
}

struct CoffeeView_Previews: PreviewProvider {
    class Spy: CoffeeDelegate {
        func closePopUp() {
            print(#function)
        }
        
        func purchase(coffee: Coffee) {
            print(#function)
        }
    }
    
    static var previews: some View {
        return CoffeeView(coffees: [
            CoffeeProduct(title: "Teste", price: "123", coffee: .tip1),
            CoffeeProduct(title: "Teste", price: "123", coffee: .tip2),
            CoffeeProduct(title: "Teste", price: "123", coffee: .tip3)
            
        ], delegate: Spy())
    }
}
