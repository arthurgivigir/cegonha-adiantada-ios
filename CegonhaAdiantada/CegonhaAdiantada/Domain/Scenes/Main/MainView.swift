//
//  MainView.swift
//  CegonhaAdiantada
//
//  Created by Arthur Givigir on 24/04/23.
//

import SwiftUI

struct MainView: View {
    @ObservedObject var savesData = SavesDataStore()
    @ObservedObject var birthCalculation = BirthCalculationDataStore()
    @State var selectedTab: Tab = .home
    
    var body: some View {
        VStack {
            if selectedTab == .home {
                BirthCalculationView(
                    birthCalculation: birthCalculation,
                    savesData: savesData
                )
                .configureView()
            } else if selectedTab == .history {
                HistoryDataView()
                    .configureView()
            } else if selectedTab == .saves {
                SavesView(savesData: savesData)
                    .configureView()
            } else {
                ConfigurationView()
                    .configureView()
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

struct MainView_Previews: PreviewProvider {
    static var previews: some View {
        MainView()
    }
}
