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
        Canvas(opaque: true, colorMode: .linear, rendersAsynchronously: false) { (context, size) in
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
        .edgesIgnoringSafeArea(.all)
        .background(.black)
    }
}

#Preview {
    SimpleCanvas()
}
