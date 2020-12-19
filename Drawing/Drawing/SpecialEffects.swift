//
//  SpecialEffects.swift
//  Drawing
//
//  Created by Dave Spina on 12/18/20.
//

import SwiftUI

struct SpecialEffects: View {
    @State private var amount: CGFloat = 0.0
    private var blendMode: BlendMode = .screen
    var body: some View {
        VStack {
            ZStack {
                Circle()
                    .fill(Color.red)
                    .frame(width: 200 * amount)
                    .offset(x: -50, y: -80)
                    .saturation(Double(amount))
                    .blur(radius: (1 - amount) * 20)
                    .blendMode(self.blendMode)
                
                Circle()
                    .fill(Color.green)
                    .frame(width: 200 * amount)
                    .saturation(Double(amount))
                    .blur(radius: (1 - amount) * 20)
                    .offset(x: 50, y: -80)
                    .blendMode(self.blendMode)
            
                Circle()
                    .fill(Color.blue)
                    .frame(width: 200 * amount)
                    .saturation(Double(amount))
                    .blur(radius: (1 - amount) * 20)
                    .blendMode(self.blendMode)
                    
            }.frame(width: 300, height: 300, alignment: /*@START_MENU_TOKEN@*/.center/*@END_MENU_TOKEN@*/)
            
            Slider(value: $amount)
            Text("\(amount)")
        }.frame(maxWidth: /*@START_MENU_TOKEN@*/.infinity/*@END_MENU_TOKEN@*/, maxHeight: .infinity)
        .background(Color.black)
        
//        ZStack {
//            Image("me")
//            Rectangle()
//                .fill(Color.red)
//                .blendMode(.difference)
//                .frame(width: 300, height: 300, alignment: /*@START_MENU_TOKEN@*/.center/*@END_MENU_TOKEN@*/)
//        }
//        .frame(width: 400, height: 400, alignment: /*@START_MENU_TOKEN@*/.center/*@END_MENU_TOKEN@*/)
//        .clipped()
    }
}

struct SpecialEffects_Previews: PreviewProvider {
    static var previews: some View {
        SpecialEffects()
    }
}
