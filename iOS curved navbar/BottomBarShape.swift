//
//  BottomBarShape.swift
//  iOS curved navbar
//
//  Created by Jonathan Triana on 15/04/26.
//

import SwiftUI

struct BottomBarShape: Shape {
    
    func path(in rect: CGRect) -> Path {
        
        var path = Path()

        let base = rect.width/6
        let x2 = base * 2
        let x3 = base * 3
        let x4 = base * 4
        let x5 = base * 5
        let x6 = base * 6

        path.move(to: CGPoint(x: 0, y: 0))
        
        path.addQuadCurve(
            to: CGPoint(x: x2, y: base),
            control: CGPoint(x: base, y: 0)
        )
        
        path.addQuadCurve(
            to: CGPoint(x: x4, y: base),
            control: CGPoint(x: x3, y: x2)
        )
        
        path.addQuadCurve(
            to: CGPoint(x: x6, y: 0),
            control: CGPoint(x: x5, y: 0)
        )
        
        
        path.closeSubpath()

        return path
    }
}
