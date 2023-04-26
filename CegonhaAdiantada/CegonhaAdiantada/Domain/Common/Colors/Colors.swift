//
//  Colors.swift
//  CegonhaAdiantada
//
//  Created by Arthur Givigir on 18/04/23.
//

import SwiftUI

enum Colors {
    case primary
    case secondary
    case tertiary
    case quaternary
    case primaryFontColor
    case secondaryFontColor
    
    var color: Color {
        switch self {
        case .primary:
            return Color("PrimaryColor")
        case .secondary:
            return Color("SecondaryColor")
        case .tertiary:
            return Color("TertiaryColor")
        case .primaryFontColor:
            return Color("PrimaryFontColor")
        case .secondaryFontColor:
            return Color("SecondaryFontColor")
        case .quaternary:
            return Color("QuaternaryColor")
        }
    }
}
