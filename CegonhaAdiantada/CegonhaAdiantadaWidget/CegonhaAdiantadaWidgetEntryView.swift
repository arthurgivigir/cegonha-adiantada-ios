//
//  CegonhaAdiantadaWidgetEntryView.swift
//  CegonhaAdiantada
//
//  Created by Arthur Givigir on 13/05/23.
//

import SwiftUI
import WidgetKit

struct CegonhaAdiantadaWidgetEntryView : View {
    var entry: CegonhaAdiantadaProvider.Entry

    var body: some View {
        GeometryReader { geometry in
            VStack {
                CardView(
                    babyName: nil,
                    calculus: entry.calculus,
                    fontColor: .primaryFontColor,
                    isWidget: true
                )
                .listRowBackground(Color.clear)
                .padding(.bottom, .size02)
            }
            .frame(width: geometry.size.width, height: geometry.size.height)
            .background {
                PentagonShape()
                    .fill(
                        Colors.primaryFontColor.color.opacity(0.1)
                    )
                    .ignoresSafeArea()
            }
        }
    }
}

struct CegonhaAdiantadaWidget_Previews: PreviewProvider {
    static var previews: some View {
        CegonhaAdiantadaWidgetEntryView(entry: CalculusEntry(date: Date(), calculus: Calculus()))
            .previewContext(WidgetPreviewContext(family: .systemMedium))
    }
}
