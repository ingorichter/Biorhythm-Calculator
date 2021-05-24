//
//  GraphView.swift
//  Biorhythm Calculator
//
//  Created by Ingo Richter on 5/23/21.
//

import SwiftUI

struct GraphView: View {
    private let numberOfLines = 11;

    var body: some View {
        ZStack {
            Rectangle().stroke(Color.orange)
            
            GeometryReader { geometry in
                let offset = Int(geometry.size.height / CGFloat(numberOfLines))
                Path { path in
                    for index in stride(from: 1, through: numberOfLines, by: 1) {
                        path.move(to: CGPoint(x: 0, y: CGFloat(10 + index * offset)))
                        path.addLine(to: CGPoint(x: geometry.size.width, y: CGFloat(10 + index * offset)))
                    }
                }.stroke()
                
                Path { path in
                    let midpoint = geometry.size.height / 2.0
                    let width = geometry.size.width
                    let wavelength = width / 28
                    let scaleFactor = midpoint
                    
                    path.move(to: CGPoint(x: 0, y: midpoint))

                    for x in stride(from: 0, through:width, by: 1) {
                        let relativeX = x / wavelength
                        let sine = sin(relativeX)
                        let y = scaleFactor * sine + midpoint
                        path.addLine(to: CGPoint(x: CGFloat(x), y: y))
                    }
                }.stroke(Color.red, lineWidth: 3.0)
            }
        }
    }
}

struct GraphView_Previews: PreviewProvider {
    static var previews: some View {
        GraphView()
    }
}
