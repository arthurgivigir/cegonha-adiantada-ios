//
//  MainView.swift
//  CegonhaAdiantada
//
//  Created by Arthur Givigir on 24/04/23.
//

import SwiftUI

struct MainView: View {
    @ObservedObject var birthCalculation = BirthCalculationDataStore()
    @State var selectedTab: Tab = .home
    
    var body: some View {
        NavigationView {
            VStack {
                if selectedTab == .home {
                    BirthCalculationView(birthCalculation: birthCalculation)
                        .configureView()
                } else {
                    Rectangle()
                        .fill(.black)
                }
            }
            .overlay(alignment: .bottom) {
                TabBarView(selectedTab: $birthCalculation.selectedTabBar)
                    .padding(.bottom, 20)
                    .onChange(of: birthCalculation.selectedTabBar) { newValue in
                        withAnimation(.easeInOut) {
                            selectedTab = newValue
                        }
                    }
                    .frame(alignment: .bottom)
            }
            .ignoresSafeArea(.keyboard)
        }
    }
}

struct MainView_Previews: PreviewProvider {
    static var previews: some View {
        MainView()
    }
}
