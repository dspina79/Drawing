//
//  ArcView.swift
//  Drawing
//
//  Created by Dave Spina on 12/16/20.
//

import SwiftUI

struct SpecialArc: Shape {
    var startAngle: Angle
    var endAngle: Angle
    var clockwise: Bool
    
    func path(in rect: CGRect) -> Path {
        var path = Path()
        path.addArc(center: CGPoint(x: rect.midX, y: rect.midY), radius: rect.width/2 - 10, startAngle: startAngle, endAngle: endAngle, clockwise: clockwise)
        
        return path
    }
}

struct ArcView: View {
    var body: some View {
        SpecialArc(startAngle: .degrees(0), endAngle: .degrees(88), clockwise: true)
            .fill(Color.pink)
            .frame(width: 260, height: 260)
    }
}

struct ArcView_Previews: PreviewProvider {
    static var previews: some View {
        ArcView()
    }
}
