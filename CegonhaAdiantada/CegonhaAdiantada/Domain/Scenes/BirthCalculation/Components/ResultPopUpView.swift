//
//  ResultPopUpView.swift
//  CegonhaAdiantada
//
//  Created by Arthur Givigir on 23/04/23.
//

import SwiftUI
import InfiniteLoop

struct ResultPopUpView: View {
    @ObservedObject var birthCalculation: BirthCalculationDataStore
    
    let delegate: BirthCalculationDelegate
    var result: Result {
        birthCalculation.result
    }
    
    init(
        delegate: BirthCalculationDelegate,
        birthCalculation: BirthCalculationDataStore
    ) {
        self.delegate = delegate
        self.birthCalculation = birthCalculation
    }
    
    var body: some View {
        VStack {
            ZStack {
                VStack {
                    Text("A criança tem \(result.weeks) semanas e \(result.days) dia(s), um total de \(result.totalDays) dia(s).")
                        .foregroundColor(Colors.primaryFontColor.color)
                        .font(
                            .system(
                                .title3,
                                design: .rounded
                            )
                            .weight(.medium)
                    )
                    
                    HStack(spacing: 0.0) {
                        LargeButton(
                            title: "Fechar",
                            backgroundColor: Color.white,
                            foregroundColor: Colors.primaryFontColor.color
                        ) {
                            delegate.closePopUp()
                        }
                        
                        Spacer()
                            .frame(width: 10.0)

                        LargeButton(
                            title: "Salvar",
                            backgroundColor: Colors.primaryFontColor.color
                        ) {
                            delegate.saveBirthCalculation()
                        }
                    }
                    .offset(y: 40)
                }
                .padding([.bottom, .leading, .trailing], .size12)
                .padding(.top, 100)
                .background(
                    GeometryReader { geometry in
                        Color.white
                            .cornerRadius(30)
                            .overlay {
                                LottieView(filename: .storkBaby)
                                    .frame(height: 200)
                                    .offset(y: -geometry.size.height/2)
                            }
                    }
                )
            }
            .padding(.all, .size12)
            .edgesIgnoringSafeArea([.top, .bottom])
            .frame(maxWidth: .infinity, maxHeight: .infinity)
            .background(Colors.primary.color.opacity(0.5))
        }
    }
}

struct ResultPopUpView_Previews: PreviewProvider {
    struct spy: BirthCalculationDelegate {
        func closePopUp() {
            print("closePopUp")
        }
        
        func saveBirthCalculation() {
            print("saveBirthCalculation")
        }
    }
    
    static var previews: some View {
        ResultPopUpView(
            delegate: spy(),
            birthCalculation: BirthCalculationDataStore()
        )
    }
}
