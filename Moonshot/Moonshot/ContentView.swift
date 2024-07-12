//
//  ContentView.swift
//  Moonshot
//
//  Created by Galih Samudra on 11/07/24.
//

import SwiftUI

struct ContentView: View {
    let astronaus: [String: Astronaut] = Bundle.main.decode("astronauts.json")
    let missions: [Mission] = Bundle.main.decode("missions.json")
    
    var body: some View {
        ScrollView {
            VStack {
                Text("print \(astronaus)")
            }
            Spacer()
            VStack {
                Text("print \(missions)")
            }
        }
    }
}

#Preview {
    ContentView()
}
