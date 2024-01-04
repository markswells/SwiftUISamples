//
//  SwiftUISamplesApp.swift
//  SwiftUISamples
//
//  Created by Mark Wells on 11/21/23.
//

import SwiftUI
import SwiftData

@main
struct SwiftUISamplesApp: App {
    var body: some Scene {
        WindowGroup {
//            ContentView()
//            LayoutNeutral()
//            CustomEnvironmentKey()
//            ParentChildViews()
//            ImageMagnifier()
//            AnimatableViews()
//            AnimationTiming()
//            ViewTransitions()
//            SwiftUI_Metal()
//            SwiftDataExample()
//            SimpleTimelineView()
            SimpleCanvas()
        }
        .modelContainer(for: Person.self)
    }
}
