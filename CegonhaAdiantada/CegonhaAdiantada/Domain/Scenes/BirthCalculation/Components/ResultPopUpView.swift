//
//  ResultPopUpView.swift
//  CegonhaAdiantada
//
//  Created by Arthur Givigir on 23/04/23.
//

import SwiftUI
import InfiniteLoop

struct ResultPopUpView: View {
    
    @State var weeks: String = .zero
    @State var days: String = .zero
    @State var totalDays: String = .zero
    
    let delegate: BirthCalculationDelegate
    
    init(
        delegate: BirthCalculationDelegate,
        weeks: String,
        days: String,
        totalDays: String
    ) {
        self.delegate = delegate
        self.weeks = weeks
        self.days = days
        self.totalDays = totalDays
    }
    
    var body: some View {
        VStack {
            ZStack {
                VStack {
                    Text("A criança tem \(weeks) semanas e \(days) dia(s), um total de \(totalDays) dia(s).")
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
                            foregroundColor: Colors.quaternary.color
                        ) {
                            delegate.closePopUp()
                        }

                        LargeButton(
                            title: "Salvar",
                            backgroundColor: Colors.quaternary.color
                        ) {
                            delegate.saveBirthCalculation()
                        }
                    }
                    .offset(y: 40)
                }
                .padding([.bottom, .leading, .trailing], .space06)
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
            .padding(.all, .space06)
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
            weeks: "60",
            days: "20",
            totalDays: "256"
        )
    }
}
