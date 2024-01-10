//
//  SimpleCanvas.swift
//  SwiftUISamples
//
//  Created by Mark Wells on 1/3/24.
//

import SwiftUI

struct SimpleCanvas: View {
    
    let colors: [Color] = [.red, .orange, .yellow, .mint, .cyan, .blue, .indigo, .black, .white]
    
    var body: some View {
        Canvas(opaque: false, colorMode: .linear, rendersAsynchronously: false) { (context, size) in
            let canvasRect = CGRect(origin: .zero, size: size)
            colors.enumerated().forEach { ix, color in
                let scale = 1.0 - Double(ix) / Double(colors.count)
                let rect = canvasRect.applying(.init(scaleX: scale, y: scale))
                    .applying(.init(translationX: (1.0 - scale) * size.width / 2.0,
                                    y: (1.0 - scale) * size.height / 2.0))
                let path = Circle().path(in: rect)
                context.fill(path, with: .color(color))
            }
        }
    }
}

/// Drawing the same thing, but not using Canvas
struct NonCanvasView: View {
    let colors: [Color] = [.red, .orange, .yellow, .mint, .cyan, .blue, .indigo, .black, .white]
    
    var body: some View {
        ZStack(alignment: .center) {
            GeometryReader(content: { geometry in
                let outerDiameter = geometry.size.width <= geometry.size.height ? geometry.size.width : geometry.size.height
                Circle()
                    .fill(colors[0])
                    .overlay(alignment: .center) {
                        ForEach(0..<9) {
                            ix in
                            let scale = 1.0 - Double(ix) / Double(colors.count)
                            Circle()
                                .fill(colors[ix])
                                .frame(width: outerDiameter * scale, height: outerDiameter * scale)
                        }
                    }
            })
        }
    }
}

/// Note: this did not work, because with a ZStack, there's no notion of the outer parent View being a rectangle - takes the whole screen,
    /// thus the .containerRelativeFrame([.vertical]) pushes the content below the frame indicated by the black outline
struct PoorNonCanvasView: View {
    let colors: [Color] = [.red, .orange, .yellow, .mint, .cyan, .blue, .indigo, .black, .white]
    
    var body: some View {
        ZStack(alignment: .center) {
            GeometryReader(content: { geometry in
                let outerDiameter = geometry.size.width <= geometry.size.height ? geometry.size.width : geometry.size.height
                ForEach(0..<9) {
                    ix in
                    let scale = 1.0 - Double(ix) / Double(colors.count)
                    Circle()
                        .fill(colors[ix])
                        .frame(width: outerDiameter * scale, height: outerDiameter * scale)
                        .containerRelativeFrame([.horizontal, .vertical])
                }
            })
        }
    }
}

#Preview {
    ZStack {
        Color(.blue)
            .ignoresSafeArea(.all)
        ScrollView {
            VStack {
                SimpleCanvas()
                    .frame(width: 300, height: 300)
                    .overlay() {
                        Rectangle().stroke(lineWidth: 2)
                    }
                NonCanvasView()
                    .frame(width: 300, height: 300)
                    .overlay() {
                        Rectangle().stroke(lineWidth: 2)
                    }
                PoorNonCanvasView()
                    .frame(width: 300, height: 300)
                    .overlay() {
                        Rectangle().stroke(lineWidth: 2)
                    }
            }
        }
    }
}
