//
//  FlipAnimation.swift
//  SwiftUISamples
//
//  Created by Mark Wells on 12/21/23.
//

import SwiftUI

struct FlipAnimation: View {
    
         @State private var degrees = Double.zero
         var body: some View {
             VStack {
                 Spacer()
                 Text("Hello")
                     .font(.largeTitle)
                     .rotation3DEffect(.degrees(degrees), axis: (x: 0, y: 1, z: 0))

                 Spacer()
                 Button("Animate") {
                     withAnimation {
                         degrees = (degrees == .zero) ? 180 : .zero
                     }
                 }
             }
         }
     }

#Preview {
    FlipAnimation()
}
