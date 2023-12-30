//
//  ContentView.swift
//  SwiftUISamples
//
//  Created by Mark Wells on 11/21/23.
//

import SwiftUI

struct User: Identifiable {
    let id: String
}

struct ContentView: View {
    
    @State private var currentUser: User? = User(id: "@markswells")
    
    var body: some View {
        VStack {
            Button("Show Alert") {
                currentUser = User(id: "@johnwells")
            }
        }
        .alert(item: $currentUser, content: { user in
            Alert(title: Text("Selected user: \(user.id)"))
        })
    }
}

#Preview {
    ContentView()
}
