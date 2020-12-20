//
//  SpriographDisplay.swift
//  Drawing
//
//  Created by Dave Spina on 12/19/20.
//

import SwiftUI

struct Spirograph: Shape {
    let innerRadius: Int
    let outerRadius: Int
    let distance: Int
    let amount: CGFloat
    
    func path(in rect: CGRect) -> Path {
        var path = Path()
        let divisor = gcd(innerRadius, outerRadius)
        let fOuterRadius = CGFloat(self.outerRadius)
        let fInnerRadius = CGFloat(self.innerRadius)
        let fDistance = CGFloat(self.distance)
        let difference = fInnerRadius - fOuterRadius
        
        // putting it all together
        let endpoint = ceil(2 * CGFloat.pi * fOuterRadius / CGFloat(divisor)) * amount
        
        for theta in stride(from: 0, through: endpoint, by: 0.01) {
            var x = difference * cos(theta) + fDistance * cos(difference / fOuterRadius * theta)
            var y = difference * sin(theta) - fDistance * sin(difference / fOuterRadius * theta)
            x += rect.width / 2
            y += rect.height / 2
            if theta == 0 {
                path.move(to: CGPoint(x: x, y: y))
            } else {
                path.addLine(to: CGPoint(x: x, y: y))
            }
        }
        
        return path
    }
    // gcd using Euclid's algorithm
    func gcd(_ a: Int, _ b: Int) -> Int {
        var a = a
        var b = b
        
        while b != 0 {
            let temp = b
            b = a % b
            a = temp
        }
        
        return a
    }
}

struct SpriographDisplay: View {
    @State private var innerRadius = 125.0
    @State private var outerRadius = 75.0
    @State private var distance = 25.0
    @State private var amount: CGFloat = 1.0
    @State private var hue = 0.6
    var body: some View {
        VStack(spacing: 0) {
            Spacer()
            Spirograph(innerRadius: Int(innerRadius), outerRadius: Int(outerRadius), distance: Int(distance), amount: amount)
                .stroke(Color(hue: hue, saturation: 1, brightness: 1), lineWidth: 1)
                .frame(width: 300, height: 300, alignment: /*@START_MENU_TOKEN@*/.center/*@END_MENU_TOKEN@*/)
            Spacer()
            Group {
                Text("Inner Radius: \(Int(innerRadius))")
                Slider(value: $innerRadius, in: 10...150, step: 1)
                    .padding([.horizontal, .bottom])
                Text("Outer Radius: \(Int(outerRadius))")
                Slider(value: $outerRadius, in: 10...150, step: 1)
                    .padding([.horizontal, .bottom])
                Text("Distance: \(Int(distance))")
                Slider(value: $distance, in: 1...150, step: 1)
                    .padding([.horizontal, .bottom])
                HStack {
                Text("Amount: \(amount, specifier: "%.2f")")
                Slider(value: $amount)
                    .padding(.horizontal)
                
                Text("Color")
                Slider(value: $hue)
                    .padding(.horizontal)
                }
            }
        }
    }
}

struct SpriographDisplay_Previews: PreviewProvider {
    static var previews: some View {
        SpriographDisplay()
    }
}
