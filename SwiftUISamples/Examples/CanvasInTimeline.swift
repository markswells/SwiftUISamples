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
            let handLengthFraction = 0.94
            let borderStrokeWidth: CGFloat = 7
            
            VStack {
                Text("\(seconds)")
                    .font(.title)
                    .padding()
                Canvas(opaque: false, colorMode: .linear, rendersAsynchronously: false) { gc, frameSize in
                    let size = CGSize(width: frameSize.width - borderStrokeWidth, height: frameSize.height - borderStrokeWidth)
                    let canvasRect = CGRect(origin: CGPoint(x: borderStrokeWidth / 2, y: borderStrokeWidth / 2), size: size)
                    let circlePath = Circle().path(in: canvasRect)
                    gc.stroke(circlePath, with: .color(.blue), lineWidth: borderStrokeWidth)
                    
                    let clockFaceRadius = size.width <= size.height ? size.width / 2 : size.height / 2
                    
                    let midPoint = CGPoint(x: size.width / 2 + borderStrokeWidth / 2, y: size.height / 2 + borderStrokeWidth / 2)
                    
                    // Calculate the angle for the clock arm (subtract pi/2 because
                    let angle = Angle(degrees: 360.0 * secondsFraction).radians - .pi / 2
                    
                    var handPath = Path()
                    handPath.move(to: midPoint)
                    handPath.addLine(to: CGPoint(x: midPoint.x + cos(angle) * clockFaceRadius * handLengthFraction, y: midPoint.y + sin(angle) * clockFaceRadius * handLengthFraction))
                    gc.stroke(handPath, with: .color(.red), lineWidth: 3)
                }
                .padding()
            }
        }
    }
}

#Preview {
    CanvasInTimeline()
}
