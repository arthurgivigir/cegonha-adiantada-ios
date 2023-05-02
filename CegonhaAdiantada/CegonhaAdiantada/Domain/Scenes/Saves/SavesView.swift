//
//  SavesView.swift
//  CegonhaAdiantada
//
//  Created by Arthur Givigir on 02/05/23.
//  
//
import SwiftUI

protocol SavesDisplayLogic {
    func display(viewModel: Saves.LoadSaves.ViewModel)
}

extension SavesView: SavesDisplayLogic {
    func display(viewModel: Saves.LoadSaves.ViewModel) {}
    func fetch() {}
}

struct SavesView: View {
    var interactor: SavesBusinessLogic?
    
    @ObservedObject var saves = SavesDataStore()
    
    
    init() {
        UINavigationBar.appearance().largeTitleTextAttributes = [
            .foregroundColor: UIColor(Colors.quaternary.color)
        ]
        UINavigationBar.appearance().titleTextAttributes = [
            .foregroundColor: UIColor(Colors.quaternary.color)
        ]
        UINavigationBar.appearance().barTintColor = .clear
        UINavigationBar.appearance().setBackgroundImage(UIImage(), for: .default)
        UINavigationBar.appearance().shadowImage = UIImage()
        
        UICollectionView.appearance().backgroundColor = .clear
    }
    
    var body: some View {
        NavigationView {
            ScrollWithBackgroundView(
                fillColor: Colors.quaternary.color.opacity(0.1),
                lottieAnimation: .caringMom
            ) {
                Spacer()
                    .frame(height: 100)
                
                EmptyListView(
                    titleText: .historyTitle,
                    emptyListText: .historyDescription,
                    textColor: .quaternary,
                    lottieAnimation: .emptyViewQuaternary
                )
                
//                ForEach(0...100, id: \.self) { _ in
//                    CardView(calculus: Calculus(result: Result(weeks: "10", days: "2", totalDays: "12")))
//                        .listRowBackground(Color.clear)
//                        .padding(.bottom, .size02)
//                }
//                .padding(.horizontal, .size20)
            }
            .navigationBarTitle(
                Text("Histórico")
            )
            .task {
                fetch()
            }
        }
    }
}

struct SavesView_Previews: PreviewProvider {
    static var previews: some View {
        return SavesView()
    }
}
