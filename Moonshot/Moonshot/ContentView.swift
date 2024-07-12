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
    
    let layout = [
        GridItem(.fixed(150))
    ]
    
    var body: some View {
        NavigationStack {
            ScrollView {
                LazyVGrid(columns: layout) {
                    ForEach(missions) { mission in
                        NavigationLink {
                            Text("Detail view mission \(mission.displayName)")
                        } label: {
                            VStack {
                                Image(mission.image)
                                    .resizable()
                                    .scaledToFit()
                                    .frame(width: 100, height: 100)
                                    .padding()
                                VStack {
                                    Text(mission.displayName)
                                        .font(.headline)
                                    Text(mission.formattedLaunchDate)
                                        .font(.caption)
                                }
                                .padding(.vertical)
                                .frame(maxWidth: .infinity)
                                .background(.lightBackground)
                            }
                            .clipShape(.rect(cornerRadius: 10))
                            .overlay {
                                RoundedRectangle(cornerRadius: 10)
                                    .stroke(.lightBackground)
                            }
                        }
                    }
                }
                .padding([.horizontal, .bottom])
            }
            .navigationTitle("Moonshot")
        }
    }
}

#Preview {
    ContentView()
}
