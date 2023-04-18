//
//  View+Modifiers.swift
//  
//
//  Created by Arthur Givigir on 15/04/23.
//

import SwiftUI

public extension View {
    
    @ViewBuilder
    func padding(_ edges: Edge.Set = .all, _ length: Spaces? = nil) -> some View {
        padding(edges, CGFloat(length?.rawValue ?? .zero))
    }
}
