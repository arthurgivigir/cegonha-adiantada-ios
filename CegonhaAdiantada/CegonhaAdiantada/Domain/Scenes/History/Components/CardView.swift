//
//  CardView.swift
//  CegonhaAdiantada
//
//  Created by Arthur Givigir on 30/04/23.
//

import SwiftUI
import InfiniteLoop

struct CardView: View {
    let babyName: String?
    let calculus: Calculus
    let fontColor: Colors
    let textWidth: CGFloat = 60
    
    var formattedDate: String {
        calculus
            .date
            .formatted(.dateTime.locale(Locale(identifier: "pt-br")))
    }

    var body: some View {
        VStack(alignment: .leading, spacing: Sizes.size02.cgFloat) {
            if let name = babyName {
                Text("Recém Nascido: \(name)")
                    .foregroundColor(fontColor.color)
                    .multilineTextAlignment(.leading)
                    .fixedSize(horizontal: false, vertical: true)
                    .font(
                        .system(
                            .title3,
                            design: .rounded
                        )
                        .weight(.medium)
                    )
                
                Spacer()
                    .frame(height: Sizes.size12.cgFloat)
                
                Text("Cálculo feito em: \(formattedDate)")
                    .foregroundColor(fontColor.color)
                    .multilineTextAlignment(.leading)
                    .fixedSize(horizontal: false, vertical: true)
                    .font(
                        .system(
                            .body,
                            design: .rounded
                        )
                        .weight(.light)
                    )
                
            } else {
                Text("Cálculo feito em: \(formattedDate)")
                    .foregroundColor(fontColor.color)
                    .multilineTextAlignment(.leading)
                    .fixedSize(horizontal: false, vertical: true)
                    .font(
                        .system(
                            .title3,
                            design: .rounded
                        )
                        .weight(.medium)
                    )
            }
            
            Text("O recém nascido tinha na data e hora do cálculo:")
                .foregroundColor(fontColor.color)
                .multilineTextAlignment(.leading)
                .fixedSize(horizontal: false, vertical: true)
                .font(
                    .system(
                        .body,
                        design: .rounded
                    )
                    .weight(.light)
                )
            
            Spacer()
                .frame(height: Sizes.size14.cgFloat)
            
            HStack {
                VStack(spacing: Sizes.size06.cgFloat) {
                    Text(calculus.result.weeks)
                        .foregroundColor(fontColor.color)
                        .font(
                            .system(
                                .body,
                                design: .rounded
                            )
                            .weight(.bold)
                        )
                    
                    Text("Semana(s)")
                        .foregroundColor(fontColor.color)
                        .font(
                            .system(
                                .caption,
                                design: .rounded
                            )
                            .weight(.light)
                        )
                        .frame(width: textWidth, alignment: .center)
                }
                .padding(Sizes.size10.cgFloat)
                .background {
                    RoundedRectangle(
                        cornerRadius: Sizes.size10.cgFloat,
                        style: .continuous
                    )
                    .fill(.white)
                    .shadow(
                        color: fontColor.color.opacity(0.3),
                        radius: Sizes.size02.cgFloat
                    )
                }
                
                VStack(spacing: Sizes.size06.cgFloat) {
                    Text(calculus.result.days)
                        .foregroundColor(fontColor.color)
                        .font(
                            .system(
                                .body,
                                design: .rounded
                            )
                            .weight(.bold)
                        )
                    
                    Text("Dia(s)")
                        .foregroundColor(fontColor.color)
                        .font(
                            .system(
                                .caption,
                                design: .rounded
                            )
                            .weight(.light)
                        )
                        .frame(width: textWidth, alignment: .center)
                }
                .padding(Sizes.size10.cgFloat)
                .background {
                    RoundedRectangle(
                        cornerRadius: Sizes.size10.cgFloat,
                        style: .continuous
                    )
                    .fill(.white)
                    .shadow(
                        color: fontColor.color.opacity(0.3),
                        radius: Sizes.size02.cgFloat
                    )
                }
                
                Text("=")
                    .foregroundColor(fontColor.color)
                    .font(
                        .system(
                            .body,
                            design: .rounded
                        )
                        .weight(.bold)
                    )
                
                VStack(spacing: Sizes.size06.cgFloat) {
                    Text(calculus.result.totalDays)
                        .foregroundColor(fontColor.color)
                        .font(
                            .system(
                                .body,
                                design: .rounded
                            )
                            .weight(.bold)
                        )
                    
                    Text("Dia(s) no Total")
                        .foregroundColor(fontColor.color)
                        .font(
                            .system(
                                .caption,
                                design: .rounded
                            )
                            .weight(.light)
                        )
                }
                .padding(Sizes.size10.cgFloat)
                .background {
                    RoundedRectangle(
                        cornerRadius: Sizes.size10.cgFloat,
                        style: .continuous
                    )
                    .fill(.white)
                    .shadow(
                        color: fontColor.color.opacity(0.3),
                        radius: Sizes.size02.cgFloat
                    )
                }
            }
        }
        .padding(.vertical, Sizes.size16.cgFloat)
        .padding(.horizontal, Sizes.size10.cgFloat)
        .frame(maxWidth: .infinity)
        .multilineTextAlignment(.leading)
        .background {
            RoundedRectangle(
                cornerRadius: 10,
                style: .continuous
            )
            .fill(.white)
        }
    }
}

struct CardView_Previews: PreviewProvider {
    static var previews: some View {
        VStack {
            CardView(
                babyName: nil,
                calculus: Calculus(
                    result: Result(
                        weeks: "2",
                        days: "2",
                        totalDays: "12"
                    )
                ),
                fontColor: .secondary
            )
            .padding(10)
            
            CardView(
                babyName: "George",
                calculus: Calculus(
                    result: Result(
                        weeks: "2",
                        days: "2",
                        totalDays: "12"
                    )
                ),
                fontColor: .secondary
            )
            .padding(10)
        }.background(.blue)
    }
}
