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
    func display(viewModel: HistoryData.LoadHistoryData.ViewModel) {}
    func fetch() {}
}

struct HistoryDataView: View {
    var interactor: HistoryDataBusinessLogic?
    
    @State var position: CGPoint = CGPoint(x: 0, y: 0)
    @ObservedObject var HistoryData = HistoryDataDataStore()
    
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
                
                ForEach(0...100, id: \.self) { _ in
                    CardView(calculus: Calculus(result: Result(weeks: "10", days: "2", totalDays: "12")))
                        .listRowBackground(Color.clear)
                        .padding(.bottom, .size02)
                }
                .padding(.horizontal, .size20)
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
