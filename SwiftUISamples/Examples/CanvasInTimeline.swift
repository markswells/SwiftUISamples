//
//  CanvasInTimeline.swift
//  SwiftUISamples
//
//  Created by Mark Wells on 1/3/24.
//

import SwiftUI

struct CanvasInTimeline: View {
    var body: some View {
        
        TimelineView(.animation) { ctx in
            let seconds = Calendar.current.component(.second, from: ctx.date)
            let secondsFraction = Double(seconds) / 60
            let handLengthFraction = 0.9
            
            VStack {
                
                Text("\(seconds)")
                    .font(.title)
                    .padding()
                Canvas(opaque: true, colorMode: .linear, rendersAsynchronously: false) { gc, size in
                    let canvasRect = CGRect(origin: .zero, size: size)
                    let circlePath = Circle().path(in: canvasRect)
                    gc.stroke(circlePath, with: .color(.blue), lineWidth: 3)
                    
                    let clockFaceRadius = size.width <= size.height ? size.width / 2 : size.height / 2
                    
                    let midPoint = CGPoint(x: size.width / 2, y: size.height / 2)
                    
                    // Calculate the angle for the clock arm (subtract pi/2 because 
                    let angle = Angle(degrees: 360.0 * secondsFraction).radians - .pi / 2
                    
                    var handPath = Path()
                    handPath.move(to: midPoint)
                    handPath.addLine(to: CGPoint(x: midPoint.x + cos(angle) * clockFaceRadius * handLengthFraction, y: midPoint.y + sin(angle) * clockFaceRadius * handLengthFraction))
                    gc.stroke(handPath, with: .color(.red), lineWidth: 2)
                }
            }
        }
    }
}

#Preview {
    CanvasInTimeline()
}
