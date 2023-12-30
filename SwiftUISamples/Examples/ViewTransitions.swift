//
//  ViewTransitions.swift
//  SwiftUISamples
//
//  Created by Mark Wells on 12/19/23.
//

import SwiftUI

struct ViewTransitions: View {
    @State private var showDetails = false
    
    var body: some View {
        VStack {
            Button("Press to show details") {
                withAnimation {
                    showDetails.toggle()
                }
            }
            
            if showDetails {
                // Moves in from the bottom
                Text("Details slide from bottom.")
                    .transition(.move(edge: .bottom))
//                    .frame(height: 400)

                // Moves in from leading out, out to trailing edge.
                Text("Details slide from side.")
                    .transition(.slide)
                
                // Starts small and grows to full size.
                Text("Details scale up.")
                    .transition(.scale)
            }
        }
    }
}

#Preview {
    ViewTransitions()
}
