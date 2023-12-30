//
//  LayoutNeutral.swift
//  SwiftUISamples
//
//  Created by Mark Wells on 12/6/23.
//

import SwiftUI

struct LayoutNeutral: View {
    
    @State private var isRed = false
    
    var body: some View {
//        Text(/*@START_MENU_TOKEN@*/"Hello, World!"/*@END_MENU_TOKEN@*/)
//            .frame(maxWidth: 400, maxHeight: 400)
//            .onTapGesture {
//                print(type(of: self.body))
//            }
        
        Text("Hello World!")
            .foregroundColor(.white)
            .colorMultiply(isRed ? Color.red : Color.blue)
            .font(.largeTitle)
            .bold()
            .onTapGesture {
                withAnimation {
                    isRed.toggle()
                }
            }
    }
}

#Preview {
    LayoutNeutral()
}
