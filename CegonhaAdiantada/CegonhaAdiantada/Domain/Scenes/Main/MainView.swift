//
//  MainView.swift
//  CegonhaAdiantada
//
//  Created by Arthur Givigir on 24/04/23.
//

import SwiftUI

struct MainView: View {
    @ObservedObject var birthCalculation = BirthCalculationDataStore()
    @State var selectedTab: Bool = true
    
    var body: some View {
        NavigationView {
            VStack {
                if selectedTab {
                    BirthCalculationView(birthCalculation: birthCalculation)
                        .configureView()
//                        .environmentObject(birthCalculation)
    //                    .transition(.asymmetric(insertion: .scale, removal: .opacity))
                } else {
                    Text("Teste")
    //                    .transition(.asymmetric(insertion: .scale, removal: .opacity))
                }
            }
            .overlay(alignment: .bottom) {
                TabBarView(selectedTab: $birthCalculation.selectedTabBar)
                    .padding(.bottom, 20)
                    .onChange(of: birthCalculation.selectedTabBar) { newValue in
                        withAnimation(.easeInOut(duration: 0.2)) {
                            selectedTab.toggle()
                        }
                    }
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
