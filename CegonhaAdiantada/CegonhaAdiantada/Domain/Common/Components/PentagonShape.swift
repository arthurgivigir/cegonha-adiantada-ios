//
//  PentagonShape.swift
//  CegonhaAdiantada
//
//  Created by Arthur Givigir on 23/04/23.
//

import SwiftUI

public struct PentagonShape: Shape {
    /// Creates a square bottomed pentagon.
    public init() {}
    
    var insetAmount: CGFloat = 0
    
    public func path(in rect: CGRect) -> Path {
        let insetRect: CGRect = rect.insetBy(dx: insetAmount, dy: insetAmount)
        let width = insetRect.width
        let height = insetRect.height

        return Path { path in
            path.move(to:    CGPoint(x: 0, y: 0))
            path.addLine(to: CGPoint(x: 0, y: height/2))
            path.addLine(to: CGPoint(x: 0, y: height))
            path.addLine(to: CGPoint(x: width, y: height))
            path.addLine(to: CGPoint(x: width, y: height/5))
            path.closeSubpath()
        }
        .offsetBy(dx: insetAmount, dy: insetAmount)
    }
}

extension PentagonShape: InsettableShape {
    public func inset(by amount: CGFloat) -> some InsettableShape {
        var shape = self
        shape.insetAmount += amount
        return shape
    }
}
