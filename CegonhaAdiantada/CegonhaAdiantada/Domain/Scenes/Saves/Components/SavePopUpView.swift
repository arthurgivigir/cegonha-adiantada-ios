//
//  SavePopUpView.swift
//  CegonhaAdiantada
//
//  Created by Arthur Givigir on 08/05/23.
//

import SwiftUI
import InfiniteLoop
import PopupView

struct SavePopUpView: View {
    let delegate: SavesDelegate
    @ObservedObject var savesData: SavesDataStore
    
    init(
        delegate: SavesDelegate,
        savesData: SavesDataStore
    ) {
        self.delegate = delegate
        self.savesData = savesData
    }
    
    var body: some View {
        VStack {
            ZStack {
                VStack {
                    TextField("Nome ou Id do Paciente", text: $savesData.babyName.maxlenght(20))
                        .textFieldStyle(
                            GradientTextFieldBackground(
                                systemImageString: "person.circle.fill",
                                fontColor: .quaternary
                            )
                        )
                    
                    HStack(spacing: 0.0) {
                        LargeButton(
                            title: "Fechar",
                            backgroundColor: Color.white,
                            foregroundColor: Colors.quaternary.color
                        ) {
                            delegate.closePopUp()
                        }
                        
                        Spacer()
                            .frame(width: 10.0)
                        
                        LargeButton(
                            title: "Salvar",
                            backgroundColor: Colors.quaternary.color
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
            .background(Colors.quaternary.color.opacity(0.5))
        }
    }
}

struct SavePopUpView_Previews: PreviewProvider {
    struct spy: SavesDelegate {
        func closePopUp() {
            print("closePopUp")
        }
        
        func saveBirthCalculation() {
            print("saveBirthCalculation")
        }
    }
    
    static var previews: some View {
        SavePopUpView(delegate: spy(), savesData: SavesDataStore())
    }
}
