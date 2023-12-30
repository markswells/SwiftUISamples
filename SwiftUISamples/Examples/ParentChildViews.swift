//
//  ParentChildViews.swift
//  SwiftUISamples
//
//  Created by Mark Wells on 11/28/23.
//

import SwiftUI

struct CustomFont: ViewModifier {
    
    func body(content: Content) -> some View {
        content
            .font(.largeTitle)
    }
}

extension View {
    
    func customFont() -> some View {
        return self.modifier(CustomFont())
    }
}

struct ParentChildViews: View {
    var body: some View {
        
        /* View modifiers
//        Text(/*@START_MENU_TOKEN@*/"Hello, World!"/*@END_MENU_TOKEN@*/)
//            .modifier(CustomFont())
        ModifiedContent(content: Text(/*@START_MENU_TOKEN@*/"Hello, World!"/*@END_MENU_TOKEN@*/), modifier: CustomFont())
            .onTapGesture {
                print(type(of: self.body))
            }
         */
        
        /* Fixed Size */
        /*
         Text("Hello World!")
            .fixedSize()
            .frame(width: 30, height: 100)
            .onTapGesture {
                print(type(of: self.body))
            }
         */
        
//        ModifiedContent(content: Text("Hello World!"), modifier: CustomFont())
        
//        Text("Hello World!")
//            .modifier(CustomFont())
        
//        Text("Hello World")
//            .customFont()
        
        Text("Hello World!")
            .background(.blue)
            .frame(width: 250)
            .background(.yellow)
            .frame(minWidth: 400)
            .background(.red)
    }
}

#Preview {
    ParentChildViews()
}
