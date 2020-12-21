//
//  DrawingGroupExample.swift
//  Drawing
//
//  Created by Dave Spina on 12/18/20.
//
import SwiftUI

struct DynamicColorRectangle: View {
    @State private var selectedStartPoint: Int = 0
    @State private var selectedEndPoint: Int = 1

    var start = 0.0
    var steps = 100
    
    let startPoints: [UnitPoint] = [.top, .bottom, .center, .leading, .trailing]
    let endPoints: [UnitPoint] = [.top, .bottom, .center, .leading, .trailing]

    var selectedStartUnit: UnitPoint {
        return startPoints[selectedStartPoint]
    }
    
    var selectedEndUnit: UnitPoint {
        return endPoints[selectedEndPoint]
    }
    
    var body: some View {
        VStack {
            ZStack {
                ForEach(0..<steps) { value in
                    Rectangle()
                        .inset(by: CGFloat(value))
                        .strokeBorder(LinearGradient(gradient: Gradient(colors: [self.color(for: value, brightness: 1),self.color(for: value, brightness: 0.5)]), startPoint: self.selectedStartUnit, endPoint: self.selectedEndUnit), lineWidth: 1)
                }
            }
            Spacer()
            HStack {
                Picker("Start", selection: $selectedStartPoint) {
                    ForEach(0..<self.startPoints.count) {
                            Text("\($0)")
                    }.pickerStyle(SegmentedPickerStyle())
                }
                Picker("End", selection: $selectedEndPoint) {
                    ForEach(0..<self.endPoints.count) {
                            Text("\($0)")
                    }.pickerStyle(SegmentedPickerStyle())
                }
            }
        }
    }
    
    func color(for value: Int, brightness: Double) -> Color {
        var targetHue = Double(value) / Double(self.steps) + Double(self.start)
        if targetHue > 1 {
            targetHue -= 1
        }
        
        return Color(hue: targetHue, saturation: 1, brightness: brightness)
    }
}

struct DynamicColorCircle: View {
    var start = 0.0
    var steps = 100
    
    
    var body: some View {
        ZStack{
            ForEach(0..<steps) { value in

                Circle()
                    .inset(by: CGFloat(value))
                    .strokeBorder(LinearGradient(gradient: Gradient(colors: [
                        self.color(for:value, brightness: 1),
                        self.color(for:value, brightness: 0.5)
                    ]), startPoint: .top, endPoint: .bottom), lineWidth: 2)
            }
        }
        .drawingGroup()
    }
    
    func color(for value: Int, brightness: Double) -> Color {
        var targetHue = Double(value) / Double(self.steps) + Double(self.start)
        if targetHue > 1 {
            targetHue -= 1
        }
        
        return Color(hue: targetHue, saturation: 1, brightness: brightness)
    }
}
struct DrawingGroupExample: View {
    @State private var colorCycle = 0.0
    
    var body: some View {
        VStack {
            DynamicColorRectangle(start: colorCycle, steps: 20)
                .frame(width: 300, height: 300)
            //Slider(value: $colorCycle)
        }
    }
}

struct DrawingGroupExample_Previews: PreviewProvider {
    static var previews: some View {
        DrawingGroupExample()
    }
}
