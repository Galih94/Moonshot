//
//  ContentView.swift
//  Moonshot
//
//  Created by Galih Samudra on 11/07/24.
//

import SwiftUI


struct CustomText: View {
    let text: String
    var body: some View {
        Text(text)
    }
    
    init(_ text: String) {
        self.text = text
    }
}

struct Address: Codable {
    let street: String
    let city: String
}

struct User: Codable {
    let name: String
    let address: Address
}

struct ContentView: View {
    var body: some View {
        Button("Decode JSON") {
            let inputJSON = """
            {
                "name": "Galih Samodra",
                "address": {
                    "street": "Krakatau 4",
                    "city": "Tangsel"
                }
            }
            """
            printUserData(from: inputJSON)
        }
    }
    
    private func printUserData(from input: String) {
        let data = Data(input.utf8)
        if let user = try? JSONDecoder().decode(User.self, from: data) {
            print("user \(user.name) lives in \(user.address.street), \(user.address.city)")
        }
    }
}

#Preview {
    ContentView()
}
