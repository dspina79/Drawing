//
//  ContentView.swift
//  Drawing
//
//  Created by Dave Spina on 12/16/20.
//

import SwiftUI

struct Triangle: Shape {
    func path(in rect: CGRect) -> Path {
        var path = Path()
        
        path.move(to: CGPoint(x: rect.midX, y: rect.minY + 10))
        path.addLine(to: CGPoint(x: rect.minX, y: rect.maxY))
        path.addLine(to: CGPoint(x: rect.maxX, y: rect.maxY))
        path.addLine(to: CGPoint(x: rect.midX, y: rect.minY + 10))
        
        return path
    }
}

struct Arc: Shape {
    var startAngle: Angle
    var endAngle: Angle
    var clockwise: Bool
    
    func path(in rect: CGRect) -> Path {
        var path = Path()
        path.addArc(center: CGPoint(x: rect.midX, y: rect.midY), radius: rect.width/2, startAngle: startAngle, endAngle: endAngle, clockwise: clockwise)
        return path
    }
}

struct ContentView: View {
    var body: some View {
        Arc(startAngle: .degrees(0), endAngle: .degrees(110), clockwise: true)
            .stroke(Color.green, style: StrokeStyle(lineWidth: 10, lineCap: .round, lineJoin: .round))
            .frame(width: 250, height: 250)
    }
}

struct ContentView_Previews: PreviewProvider {
    static var previews: some View {
        ContentView()
    }
}
