//
//  AnimationTiming.swift
//  SwiftUISamples
//
//  Created by Mark Wells on 12/7/23.
//

import SwiftUI

extension Animation {
    static var easeInOutBack: Animation {
        Animation.timingCurve(1.0, -0.78, 0.0, 1.63)
    }
    
    static func easeInOutBack(duration: TimeInterval = 0.2) -> Animation {
        Animation.timingCurve(1.0, -0.78, 0.0, 1.63, duration: duration)
    }
}

struct AnimationTiming: View {
    
    @State var offset: CGFloat = -200
    
    var body: some View {
        Text("Hello, World!")
            .offset(CGSize(width: 0.0, height: offset))
            .animation(Animation.easeInOutBack(duration: 1.0), value: offset)
            .onTapGesture {
                offset = offset == 200.0 ? -200 : 200
            }
    }
}

#Preview {
    AnimationTiming()
}
