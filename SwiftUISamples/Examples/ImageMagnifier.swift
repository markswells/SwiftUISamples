//
//  ImageMagnifier.swift
//  SwiftUISamples
//
//  Created by Mark Wells on 11/30/23.
//

import SwiftUI

struct ImageMagnifier: View {
    @State var totalZoom = 1.0
    @State var currentZoom = 0.0
    
    var body: some View {
        Image("bird")
            .scaleEffect(currentZoom + totalZoom)
            .gesture(MagnifyGesture()
                .onChanged({ value in
                    currentZoom = value.magnification - 1
                })
                    .onEnded({ value in
                        totalZoom += currentZoom
                        currentZoom = 0
                    }))
    }
}

#Preview {
    ImageMagnifier()
}
