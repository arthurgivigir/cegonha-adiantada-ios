//
//  HistoryDataView.swift
//  CegonhaAdiantada
//
//  Created by Arthur Givigir on 28/04/23.
//  
//
import SwiftUI
import InfiniteLoop

protocol HistoryDataDisplayLogic {
    func display(viewModel: HistoryData.LoadHistoryData.ViewModel)
}

extension HistoryDataView: HistoryDataDisplayLogic {
    typealias Request = HistoryData.LoadHistoryData.Request
    typealias ViewModel = HistoryData.LoadHistoryData.ViewModel
    
    func display(viewModel: ViewModel) {
        historyData.history = viewModel.calculus
    }
    
    func fetch() {
        interactor?.load(request: Request())
    }
}

struct HistoryDataView: View {
    var interactor: HistoryDataBusinessLogic?
    
    @ObservedObject var historyData = HistoryDataDataStore()
    
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
                lottieAnimation: .babyDaddy
            ) {
                Spacer()
                    .frame(height: 100)
                
                if !historyData.history.isEmpty {
                    ForEach(historyData.history, id: \.self) { calculus in
                        CardView(
                            babyName: nil,
                            calculus: calculus,
                            fontColor: .secondary
                        )
                        .listRowBackground(Color.clear)
                        .padding(.bottom, .size02)
                        .frame(maxWidth: .infinity)
                    }
                    .padding(.horizontal, .size20)
                } else {
                    EmptyListView(
                        titleText: .historyTitle,
                        emptyListText: .historyDescription,
                        textColor: .secondary,
                        lottieAnimation: .emptyViewSecondary
                    )
                }
                
                Spacer()
                    .frame(height: 100)
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

struct HistoryDataView_Previews: PreviewProvider {
    static var previews: some View {
        return HistoryDataView()
    }
}
