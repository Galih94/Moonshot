//
//  ContentView.swift
//  Moonshot
//
//  Created by Galih Samudra on 11/07/24.
//

import SwiftUI

struct ContentView: View {
    var body: some View {
        Image(.example)
            .resizable()
            .scaledToFit()
            .containerRelativeFrame(.horizontal) { size, axis in
                size * 0.5
            }
    }
}

#Preview {
    ContentView()
}
