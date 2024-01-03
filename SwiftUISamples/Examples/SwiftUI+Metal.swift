//
//  SwiftUI+Metal.swift
//  SwiftUISamples
//
//  Created by Mark Wells on 12/24/23.
//

import SwiftUI

struct SwiftUI_Metal: View {
    
    @State var start = Date.now
    
    var body: some View {
        ScrollView {
            LazyVGrid(columns: Array(repeating: GridItem(.flexible()), count: 2), spacing: 15) {
                baseImage().colorEffect(ShaderLibrary.passthrough()).roundedBackground()
                baseImage().colorEffect(ShaderLibrary.colorChange()).roundedBackground()
                baseImage().colorEffect(ShaderLibrary.darkened(.float(0.3))).roundedBackground()
                baseImage().colorEffect(ShaderLibrary.colorInvert()).roundedBackground()
                baseImage().colorEffect(ShaderLibrary.gradient()).roundedBackground()
                rainbowTimelineView().roundedBackground()
                waveTimelineView().roundedBackground()
            }
            .padding(10)
        }
    }
    
    func baseImage() -> some View {
        Image(systemName: "figure.walk.circle")
            .font(.system(size: 120))
            .foregroundStyle(.blue)
    }
    
    func rainbowTimelineView() -> some View {
        TimelineView(.animation) { tl in
            let time = start.distance(to: tl.date)
            
            Image(systemName: "figure.walk.circle")
                .font(.system(size: 120))
                .foregroundStyle(.blue)
                .colorEffect(ShaderLibrary.rainbow(.float(time)))
        }
    }
    
    func waveTimelineView() -> some View {
        TimelineView(.animation) { tl in
            let time = start.distance(to: tl.date)
            
            Image(systemName: "figure.walk.circle")
                .font(.system(size: 120))
                .foregroundStyle(.blue)
                .background(.white)
                .drawingGroup()
                .distortionEffect(ShaderLibrary.wave(.float(time)),
                                  maxSampleOffset: .zero)
        }
    }
}

#Preview {
    SwiftUI_Metal()
}

struct RoundedBackground: ViewModifier {
    func body(content: Content) -> some View {
        content
            .padding().background(Color(white: 0.95)).cornerRadius(20)
    }
}

extension View {
    func roundedBackground() -> some View {
        modifier(RoundedBackground())
    }
}
