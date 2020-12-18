//
//  Flower.swift
//  Drawing
//
//  Created by Dave Spina on 12/17/20.
//

import SwiftUI
struct FlowerShape: Shape {
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
struct Flower: View {
    @State private var petalOffset: Double = -20
    @State private var petalWidth: Double = 100
    var body: some View {
        VStack {
            FlowerShape(petaOffset: petalOffset, petalWidth: petalWidth)
                .fill(Color.blue, style: FillStyle(eoFill: true))

            Text("Offset: \(petalOffset)")
            Slider(value: $petalOffset, in: -40...40)
                .padding(.horizontal)
            Text("Width: \(petalWidth)")
            Slider(value: $petalWidth, in: 1...100)
                .padding(.horizontal)
        }
    }
}

struct Flower_Previews: PreviewProvider {
    static var previews: some View {
        Flower()
    }
}
