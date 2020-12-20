//
//  TrapezoidAnimation.swift
//  Drawing
//
//  Created by Dave Spina on 12/19/20.
//

import SwiftUI

struct Trapezoid: Shape {
    var insetAmount: CGFloat
    
    var animatableData: CGFloat {
        get { self.insetAmount }
        set { self.insetAmount = newValue }
    }
    
    func path(in rect: CGRect) -> Path {
        var path = Path()
        
        path.move(to: CGPoint(x: 0, y: rect.maxY))
        path.addLine(to: CGPoint(x: insetAmount, y: rect.minY))
        path.addLine(to: CGPoint(x: rect.maxX - insetAmount, y: rect.minY))
        path.addLine(to: CGPoint(x: rect.maxX, y: rect.maxY))
        path.addLine(to: CGPoint(x: 0, y: rect.maxY))
        return path
    }
}

struct TrapezoidAnimation: View {
    @State private var insetAmount: CGFloat = 50.0
    var body: some View {
        Trapezoid(insetAmount: insetAmount)
            .fill(Color.green)
            .frame(width: 200, height: 100, alignment: /*@START_MENU_TOKEN@*/.center/*@END_MENU_TOKEN@*/)
            .onTapGesture {
                withAnimation {
                    self.insetAmount = CGFloat.random(in: 10...90)
                }
            }
    }
}

struct TrapezoidAnimation_Previews: PreviewProvider {
    static var previews: some View {
        TrapezoidAnimation()
    }
}
