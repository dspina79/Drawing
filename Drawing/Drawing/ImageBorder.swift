//
//  ImageBorder.swift
//  Drawing
//
//  Created by Dave Spina on 12/17/20.
//

import SwiftUI

struct ImageBorder: View { 
    var body: some View {
        ZStack {
        LinearGradient(gradient: Gradient(colors: [.blue, .green]), startPoint: .top, endPoint: .bottom)
            VStack {
                Capsule()
                    .strokeBorder(ImagePaint(image: Image("me"), scale: 0.1), lineWidth: 25)
                    .frame(width: 200, height: 300)
                    
            }
        }
    }
}

struct ImageBorder_Previews: PreviewProvider {
    static var previews: some View {
        ImageBorder()
    }
}
