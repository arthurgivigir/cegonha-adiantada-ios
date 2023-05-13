//
//  ConfigurationView.swift
//  CegonhaAdiantada
//
//  Created by Arthur Givigir on 02/05/23.
//  
//
import SwiftUI

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
                Spacer()
                    .frame(height: 100)
                
                Text("teste")
                
                Spacer()
                    .frame(height: 150)
            }
            .edgesIgnoringSafeArea(.bottom)
            .navigationBarTitle(
                Text("Configurações")
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
