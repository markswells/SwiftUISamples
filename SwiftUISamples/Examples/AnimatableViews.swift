//
//  AnimatableViews.swift
//  SwiftUISamples
//
//  Created by Mark Wells on 12/7/23.
//

import SwiftUI

struct TypewriterTextView: View, Animatable {
    
    @Environment(\.accessibilityVoiceOverEnabled) var accessibilityVoiceOverEnabled
    @Environment(\.accessibilityReduceMotion) var accessibilityReduceMotion
    
    var text: String
    var count = 0
    
    var animatableData: Double {
        get { Double(count) }
        set { count = Int(max(0, newValue)) }
    }
    
    var body: some View {
        if (accessibilityReduceMotion || accessibilityVoiceOverEnabled) {
            Text(text)
        }
        else {
            ZStack {
                Text(text)
                    .hidden()
                    .overlay (
                        Text(text.prefix(count)), alignment: .topLeading
                    )
            }
        }
    }
}

struct AnimatableViews: View {
    
    @State private var count = 0
    var text: String = "Hello World! This is a very long message in which the letters will appear typed out one at a time. "
    
    var body: some View {
        VStack(spacing: 20) {
            TypewriterTextView(text: text, count: count)
                .font(.largeTitle)
                .padding([.leading, .trailing])
            
            Button("Type message") {
                withAnimation(.linear(duration: 3)) {
                    count = text.count
                }
            }
            
            Button("Clear") {
//                withAnimation(.linear(duration: 2)) {
                    count = 0
//                }
            }
        }
    }
}

#Preview {
    AnimatableViews()
}
