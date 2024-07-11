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
        print("Creating new text: \(text)")
        self.text = text
    }
}

struct ContentView: View {
    var body: some View {
        ScrollView(.horizontal) {
            LazyHStack(spacing: 10) {
                ForEach(0..<100, id: \.self) { index in
                    CustomText("No. \(index)")
                }
            }
            .frame(maxHeight: .infinity)
        }
    }
}

#Preview {
    ContentView()
}
