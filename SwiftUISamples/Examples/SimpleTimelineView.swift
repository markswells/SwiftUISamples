//
//  SimpleTimelineView.swift
//  SwiftUISamples
//
//  Created by Mark Wells on 1/3/24.
//

import SwiftUI

struct SimpleTimelineView: View {
    var body: some View {
        ZStack {
            Circle()
                .stroke(lineWidth: 5.0)
            TimelineView(.animation) { ctx in
                let dt = ctx.date.formatted(date: .long, time: .omitted)
                Text(dt).padding()
                let tm = ctx.date.formatted(date: .omitted, time: .standard)
                Text(tm)
            }
            .font(.headline)
        }
        .padding(50)
    }
}

#Preview {
    SimpleTimelineView()
}
