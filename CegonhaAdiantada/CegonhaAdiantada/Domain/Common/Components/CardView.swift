//
//  CardView.swift
//  CegonhaAdiantada
//
//  Created by Arthur Givigir on 30/04/23.
//

import SwiftUI
import InfiniteLoop

protocol CardViewDelegate {
    func deleteItem(index: Int)
}

struct CardView: View {
    let babyName: String?
    let calculus: Calculus
    let fontColor: Colors
    let textWidth: CGFloat = 60
    let isWidget: Bool
    let index: Int
    let delegate: CardViewDelegate?
    
    var titleFont: Font.TextStyle {
        isWidget ? .callout : .title3
    }
    
    var bodyFont: Font.TextStyle {
        isWidget ? .caption : .body
    }
    
    var formattedDate: String {
        calculus
            .date
            .formatted(.dateTime.locale(Locale(identifier: "pt-br")))
    }
    
    var formattedBirthDate: String {
        calculus
            .birthDate
            .formatted(.dateTime.locale(Locale(identifier: "pt-br")))
    }
    
    init(
        babyName: String? = nil,
        calculus: Calculus,
        fontColor: Colors,
        isWidget: Bool = false,
        index: Int,
        delegate: CardViewDelegate? = nil
    ) {
        self.babyName = babyName
        self.calculus = calculus
        self.fontColor = fontColor
        self.isWidget = isWidget
        self.index = index
        self.delegate = delegate
    }
    
    var body: some View {
        VStack(alignment: .leading, spacing: Sizes.size02.cgFloat) {
            if let name = babyName {
                HStack {
                    Text("Recém Nascido: \(name)")
                        .foregroundColor(fontColor.color)
                        .multilineTextAlignment(.leading)
                        .fixedSize(horizontal: false, vertical: true)
                        .font(
                            .system(
                                titleFont,
                                design: .rounded
                            )
                            .weight(.medium)
                    )
                    
                    if let delegate, !isWidget {
                        Button {
                            delegate.deleteItem(index: index)
                        } label: {
                            Label("Deletar", systemImage: "trash")
                                .foregroundColor(fontColor.color)
                        }
                    }
                }
                
                Spacer()
                    .frame(height: Sizes.size12.cgFloat)
                
                Text("Dia do Cáculo: \(formattedDate)")
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
                HStack {
                    Text("Dia do Cáculo: \(formattedDate)")
                        .foregroundColor(fontColor.color)
                        .multilineTextAlignment(.leading)
                        .fixedSize(horizontal: false, vertical: true)
                        .font(
                            .system(
                                titleFont,
                                design: .rounded
                            )
                            .weight(.medium)
                    )
                    
                    Spacer()
                    
                    if let delegate, !isWidget {
                        Button {
                            delegate.deleteItem(index: index)
                        } label: {
                            Label("", systemImage: "trash")
                                .foregroundColor(fontColor.color)
                        }
                    }
                }
            }
            
            Text("Data de Nascimento: \(formattedBirthDate)")
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
            
            Text("O recém nascido tinha na data e hora do cálculo:")
                .foregroundColor(fontColor.color)
                .multilineTextAlignment(.leading)
                .fixedSize(horizontal: false, vertical: true)
                .font(
                    .system(
                        bodyFont,
                        design: .rounded
                    )
                    .weight(.light)
                )
            
            Spacer()
                .frame(height: isWidget ? Sizes.size04.cgFloat : Sizes.size14.cgFloat)
            
            HStack {
                VStack(spacing: Sizes.size06.cgFloat) {
                    Text(calculus.result.weeks)
                        .foregroundColor(fontColor.color)
                        .font(
                            .system(
                                bodyFont,
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
                                bodyFont,
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
                            bodyFont,
                            design: .rounded
                        )
                        .weight(.bold)
                    )
                
                VStack(spacing: Sizes.size06.cgFloat) {
                    Text(calculus.result.totalDays)
                        .foregroundColor(fontColor.color)
                        .font(
                            .system(
                                bodyFont,
                                design: .rounded
                            )
                            .weight(.bold)
                        )
                    
                    Text(isWidget ? "Total" : "Dia(s) no Total")
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
            if isWidget {
                EmptyView()
            } else {
                RoundedRectangle(
                    cornerRadius: 10,
                    style: .continuous
                )
                .fill(.white)
            }
        }
    }
}

struct CardView_Previews: PreviewProvider {
    struct Spy: CardViewDelegate {
        func deleteItem(index: Int) {
            print(index)
        }
    }
    
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
                fontColor: .secondary,
                index: 0,
                delegate: Spy()
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
                fontColor: .secondary,
                index: 0
            )
            .padding(10)
        }.background(.blue)
    }
}
