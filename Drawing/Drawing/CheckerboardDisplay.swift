//
//  CheckerboardDisplay.swift
//  Drawing
//
//  Created by Dave Spina on 12/19/20.
//

import SwiftUI

struct Checkerboard: Shape {
    var rows: Int
    var columns: Int
    
    public var animatableData: AnimatablePair<Double,Double> {
        get { AnimatablePair(Double(rows), Double(columns)) }
        set {
            self.rows = Int(newValue.first)
            self.columns = Int(newValue.second)
        }
        
    }
    
    func path(in rect: CGRect) -> Path {
        var path = Path()
        let rowSize = rect.width / CGFloat(rows)
        let columnSize = rect.height / CGFloat(columns)
        
        for row in 0..<rows {
            for column in 0..<columns {
                if (row + column) % 2 == 0 {
                    let startX = CGFloat(column) * columnSize
                    let startY = CGFloat(row) * rowSize
                    let rectangle = CGRect(x: startX, y: startY, width: columnSize, height: rowSize)
                    path.addRect(rectangle)
                }
            }
        }
        return path
    }
}

struct CheckerboardDisplay: View {
    @State private var columns = 4
    @State private var rows = 4
    var body: some View {
        NavigationView {
            Checkerboard(rows: self.rows, columns: self.columns)
                .frame(width: 300, height: 300, alignment: /*@START_MENU_TOKEN@*/.center/*@END_MENU_TOKEN@*/)
                .border(Color.black, width: 1)
                .background(Color.red)
                .onTapGesture {
                    withAnimation(.linear(duration: 3.0)) {
                        rows *= 4
                        columns *= 2
                    }
                }.navigationBarItems(leading: Button(action: {
                    withAnimation(.linear(duration: 3.0)) {
                        reset()
                    }
                }) {
                    Text("Reset")
                })
        }
    }
    
    func reset() {
        self.columns = 4
        self.rows = 4
    }
}

struct CheckerboardDisplay_Previews: PreviewProvider {
    static var previews: some View {
        CheckerboardDisplay()
    }
}
