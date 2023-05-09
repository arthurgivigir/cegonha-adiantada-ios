//
//  EmptyListView.swift
//  CegonhaAdiantada
//
//  Created by Arthur Givigir on 01/05/23.
//

import SwiftUI

enum EmptyListTexts: String {
    case historyTitle = "Sem histórico, ainda..."
    case historyDescription = "Parece que você não fez nenhum cálculo"
    case saveTitle = "Nada salvo, ainda..."
    case saveDescription = "Parece que você ainda não salvou nenhum cálculo"
}

struct EmptyListView: View {
    var titleText: EmptyListTexts
    var emptyListText: EmptyListTexts
    var textColor: Colors
    var lottieAnimation: LottieFiles
    
    var body: some View {
        VStack {
            LottieView(filename: lottieAnimation)
                .frame(height: 200)
            
            Text(titleText.rawValue)
                .foregroundColor(textColor.color)
                .font(
                    .system(
                        .title,
                        design: .rounded
                    )
                    .weight(.medium)
                )
                .multilineTextAlignment(.center)
            
            Spacer()
                .frame(height: 10)
            
            Text(emptyListText.rawValue)
                .foregroundColor(textColor.color)
                .font(
                    .system(
                        .title3,
                        design: .rounded
                    )
                    .weight(.thin)
                )
                .multilineTextAlignment(.center)
                .frame(width: 400)
                
        }
    }
}

struct EmptyListView_Previews: PreviewProvider {
    static var previews: some View {
        EmptyListView(
            titleText: .historyTitle,
            emptyListText: .historyDescription,
            textColor: .secondary,
            lottieAnimation: .emptyViewSecondary
        )
    }
}
