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

struct ContentView: View {
    var body: some View {
        NavigationStack {
            NavigationLink {
                Text("Detail")
            } label: {
                VStack {
                    Text("Thsi is label")
                    Text("So is this is")
                    Image(systemName: "face.smiling")
                }
            }
            .navigationTitle("SwiftUI")
        }
    }
}

#Preview {
    ContentView()
}
