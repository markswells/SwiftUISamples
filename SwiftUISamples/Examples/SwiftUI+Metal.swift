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
        VStack {
            Image(systemName: "figure.walk.circle")
                .font(.system(size: 120))
                .foregroundStyle(.blue)
    //            .colorEffect(ShaderLibrary.passthrough())
                .colorEffect(ShaderLibrary.colorChange())
    //            .colorEffect(ShaderLibrary.colorInvert())
    //            .colorEffect(ShaderLibrary.gradient())
    //            .colorEffect(ShaderLibrary.gradient())

            TimelineView(.animation) { tl in
                let time = start.distance(to: tl.date)
                
                Image(systemName: "figure.walk.circle")
                    .font(.system(size: 120))
                    .foregroundStyle(.blue)
                    .colorEffect(ShaderLibrary.rainbow(.float(time)))
            }

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
}

#Preview {
    SwiftUI_Metal()
}
