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

struct Arc: InsettableShape {
    var startAngle: Angle
    var endAngle: Angle
    var clockwise: Bool
    var insetAmount: CGFloat = 0
    
    func path(in rect: CGRect) -> Path {
        var path = Path()
        path.addArc(center: CGPoint(x: rect.midX, y: rect.midY), radius: rect.width/2 - insetAmount, startAngle: startAngle, endAngle: endAngle, clockwise: clockwise)
        return path
    }
    
    func inset(by amount: CGFloat) -> some InsettableShape {
        var arc = self
        arc.insetAmount += amount
        return arc
    }
}

struct Flower: Shape {
    var petaOffset: Double = -20
    var petalWidth: Double = 100
    
    func path(in rect: CGRect) -> Path {
        var path = Path()
        for val in stride(from: 0, to: CGFloat.pi * 2, by: CGFloat.pi/8.0) {
            let rotationAngle = CGAffineTransform(rotationAngle: val)
            let position = rotationAngle.concatenating(CGAffineTransform(translationX: rect.width/2, y: rect.height/2))
            
            let originalPetal = Path(ellipseIn: CGRect(x: CGFloat(petaOffset), y: 0, width: CGFloat(petalWidth), height: rect.width/2))
            let rotatedPetal = originalPetal.applying(position)
            
            path.addPath(rotatedPetal)
            
        }
        return path
    }
}

struct ContentView: View {
    @State private var petalOffset: Double = -20
    @State private var petalWidth: Double = 100
    
    var body: some View {
        ZStack {
        LinearGradient(gradient: Gradient(colors: [.blue, .green]), startPoint: .top, endPoint: .bottom)
            VStack {
                Capsule()
                    .strokeBorder(ImagePaint(image: Image("me"), scale: 0.1), lineWidth: 25)
                    .frame(width: 200, height: 300)
                    
            }
        }
        //        VStack {
//            Flower(petaOffset: petalOffset, petalWidth: petalWidth)
//                .fill(Color.blue, style: FillStyle(eoFill: true))
//
//            Text("Offset: \(petalOffset)")
//            Slider(value: $petalOffset, in: -40...40)
//                .padding(.horizontal)
//            Text("Width: \(petalWidth)")
//            Slider(value: $petalWidth, in: 1...100)
//                .padding(.horizontal)
//        }
    }
}

struct ContentView_Previews: PreviewProvider {
    static var previews: some View {
        ContentView()
    }
}
