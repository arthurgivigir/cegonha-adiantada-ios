//
//  GradientTextFieldBackground.swift
//  
//
//  Created by Arthur Givigir on 23/04/23.
//

import SwiftUI

public struct GradientTextFieldBackground: TextFieldStyle {
    
    let systemImageString: String
    let fontColor: Colors
    
    // Hidden function to conform to this protocol
    public func _body(configuration: TextField<Self._Label>) -> some View {
        ZStack {
            RoundedRectangle(cornerRadius: 5.0)
                .stroke(
                    LinearGradient(
                        colors: [
                            fontColor.color,
                            fontColor.color
                        ],
                        startPoint: .leading,
                        endPoint: .trailing
                    )
                )
                .frame(height: 40)
                .background(
                    RoundedRectangle(cornerRadius: 5.0)
                        .fill(.white)
                )
            
            HStack {
                Image(systemName: systemImageString)
                // Reference the TextField here
                configuration
                    .foregroundColor(fontColor.color)
                    .keyboardType(.decimalPad)
            }
            .padding(.leading, 10)
            .foregroundColor(fontColor.color)
        }
    }
}
