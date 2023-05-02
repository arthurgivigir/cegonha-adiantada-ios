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
    
    var body: some View {
        VStack {
            Text("Hello World")
        }
        .task {
            fetch()
        }
    }
}

struct ConfigurationView_Previews: PreviewProvider {
    static var previews: some View {
        return ConfigurationView()
    }
}
