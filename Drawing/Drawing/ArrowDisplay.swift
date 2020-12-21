//
//  ArrowDisplay.swift
//  Drawing
//
//  Created by Dave Spina on 12/20/20.
//

import SwiftUI

struct Arrow: InsettableShape {
    var insetAmount: CGFloat  = 0.0
    
    var animatableData: CGFloat {
        get { self.insetAmount }
        set { self.insetAmount = newValue }
    }
    
    func path(in rect: CGRect) -> Path {
        var path = Path()
        path.move(to: CGPoint(x: rect.midX, y: 0))
        path.addLine(to: CGPoint(x: 0, y: rect.height / 3))
        path.addLine(to: CGPoint(x: rect.width / 3, y: rect.height / 3))
        path.addLine(to: CGPoint(x: rect.width / 3, y: rect.maxY))
        path.addLine(to: CGPoint(x: rect.width * 2/3, y: rect.maxY))
        path.addLine(to: CGPoint(x: rect.width * 2/3, y: rect.height/3))
        path.addLine(to: CGPoint(x: rect.maxX, y: rect.height/3))
        path.addLine(to: CGPoint(x: rect.midX, y: 0))
        
        return path
    }
    
    func inset(by amount: CGFloat) -> some InsettableShape {
        var arrow  = self
        arrow.insetAmount += amount
        return arrow
    }
}

struct ArrowDisplay: View {
    @State private var borderLine: CGFloat = 1.0
    var body: some View {
        VStack {
            Arrow()
                .stroke(style: StrokeStyle(lineWidth: CGFloat(borderLine), lineCap: .round, lineJoin: .round))
            .frame(width: 100, height: 200, alignment: /*@START_MENU_TOKEN@*/.center/*@END_MENU_TOKEN@*/)
            .onTapGesture {
                withAnimation {
                    borderLine = CGFloat.random(in: 1...20)
                }
            }
        }
    }
}

struct ArrowDisplay_Previews: PreviewProvider {
    static var previews: some View {
        ArrowDisplay()
    }
}
