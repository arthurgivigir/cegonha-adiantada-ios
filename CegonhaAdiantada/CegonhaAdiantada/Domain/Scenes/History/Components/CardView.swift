//
//  CardView.swift
//  CegonhaAdiantada
//
//  Created by Arthur Givigir on 30/04/23.
//

import SwiftUI

struct CardView: View {
    let calculus: Calculus

    var body: some View {
        VStack(alignment: .leading) {
            Text(calculus.result.weeks)
                .font(.largeTitle)
                .foregroundColor(.black)

            Text(calculus.result.days)
                .font(.title)
                .foregroundColor(.gray)
        }
        .frame(maxWidth: .infinity)
        .multilineTextAlignment(.center)
        .background {
            RoundedRectangle(cornerRadius: 10, style: .continuous)
                .fill(.white)
        }
    }
}

struct CardView_Previews: PreviewProvider {
    static var previews: some View {
        VStack {
            ForEach(0...10, id: \.self) { value in
                CardView(calculus: Calculus(result: Result(weeks: "\(value)", days: "2", totalDays: "12")))
                    .padding(10)
            }
        }.background(.blue)
    }
}
