//
//  CegonhaAdiantadaWidget.swift
//  CegonhaAdiantadaWidget
//
//  Created by Arthur Givigir on 13/05/23.
//

import WidgetKit
import SwiftUI

struct CegonhaAdiantadaWidget: Widget {
    let kind: String = "CegonhaAdiantadaWidget"

    var body: some WidgetConfiguration {
        StaticConfiguration(kind: kind, provider: CegonhaAdiantadaProvider()) { entry in
            CegonhaAdiantadaWidgetEntryView(entry: entry)
                .background(Color.white)
        }
        .configurationDisplayName("Cegonha Adiantada")
        .description("Este widget apresenta os últimos 5 cálculus feitos dentro do app!")
        .supportedFamilies([.systemMedium])
    }
}
