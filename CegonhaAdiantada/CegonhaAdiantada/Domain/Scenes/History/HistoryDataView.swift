//
//  HistoryDataView.swift
//  CegonhaAdiantada
//
//  Created by Arthur Givigir on 28/04/23.
//  
//
import SwiftUI

protocol HistoryDataDisplayLogic {
    func display(viewModel: HistoryData.LoadHistoryData.ViewModel)
}

extension HistoryDataView: HistoryDataDisplayLogic {
    func display(viewModel: HistoryData.LoadHistoryData.ViewModel) {}
    func fetch() {}
}

struct HistoryDataView: View {
    var interactor: HistoryDataBusinessLogic?
    
    @ObservedObject var HistoryData = HistoryDataDataStore()
    
    init() {
        //Use this if NavigationBarTitle is with Large Font
        UINavigationBar.appearance().largeTitleTextAttributes = [
            .foregroundColor: UIColor(Colors.secondary.color)
        ]
        UICollectionView.appearance().backgroundColor = .clear
    }
    
    var body: some View {
        NavigationView {
            ZStack {
                GeometryReader { geometry in
                    VStack {
                        LottieView(filename: .babyDaddy)
                            .frame(width: geometry.size.width/2.5, height: geometry.size.height/3)
                            .offset(x: geometry.size.width - geometry.size.width/3, y: -(geometry.size.height/6))
                        Spacer()
                    }
                
                    PentagonShape()
                        .fill(Colors.secondary.color.opacity(0.1))
                        .ignoresSafeArea()
                    
                    VStack {
                        List {
                            ForEach(0...100, id: \.self) { _ in
                                CardView(weeks: "10", days: "30")
                                    .listRowBackground(Color.clear)
                            }
                        }
                        .padding(.top, 50)
                        .listStyle(.plain)
                    }
                }
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

struct CardView: View {
    let weeks: String
    let days: String

    var body: some View {
        ZStack {
            RoundedRectangle(cornerRadius: 10, style: .continuous)
                .fill(.white)

            VStack {
                Text(weeks)
                    .font(.largeTitle)
                    .foregroundColor(.black)

                Text(days)
                    .font(.title)
                    .foregroundColor(.gray)
            }
            .padding(20)
            .multilineTextAlignment(.center)
        }
    }
}

extension UICollectionReusableView {
    override open var backgroundColor: UIColor? {
        get { .clear }
        set { }

        // default separators use same color as background
        // so to have it same but new (say red) it can be
        // used as below, otherwise we just need custom separators
        //
        // set { super.backgroundColor = .red }
    }
}


struct HistoryDataView_Previews: PreviewProvider {
    static var previews: some View {
        return HistoryDataView()
    }
}
