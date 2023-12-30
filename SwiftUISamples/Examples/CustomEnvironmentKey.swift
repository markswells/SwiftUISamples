//
//  PushDownViewStack.swift
//  SwiftUISamples
//
//  Created by Mark Wells on 11/21/23.
//

import SwiftUI

struct RequiredFieldEnvironmentKey: EnvironmentKey {
    typealias Value = Bool
    
    static var defaultValue: Value = false
}

extension EnvironmentValues {
    var required: Bool {
        get { self[RequiredFieldEnvironmentKey.self] }
        set { self[RequiredFieldEnvironmentKey.self] = newValue }
    }
}

struct RequirableTextField: View {
    
    @Environment(\.required) var required
    let title: String
    @Binding var text: String
    
    var body: some View {
        HStack() {
            TextField(title, text: $text)
                .textFieldStyle(PlainTextFieldStyle())
            Image(systemName: "asterisk")
                .imageScale(.small)
                .foregroundColor(.red)
                .opacity(required && text.count < 1 ? 1.0 : 0.0)
        }
    }
}

struct CustomEnvironmentKey: View {
    
    @State var firstName: String = ""
    @State var lastName: String = ""
    @State var isRequired: Bool = false

    var body: some View {
        Form {
            RequirableTextField(title: "First name", text: $firstName)
            RequirableTextField(title: "Last name", text: $lastName)
            Toggle(isOn: $isRequired, label: {
                Text("Make Required?")
            })
        }
        .environment(\.required, isRequired)
        .onTapGesture {
            print(type(of: self.body))
        }
    }
}

#Preview {
    CustomEnvironmentKey()
}
