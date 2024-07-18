//
//  ContentView.swift
//  Moonshot
//
//  Created by Galih Samudra on 11/07/24.
//

import SwiftUI

struct CustomGridMissionView: View {
    let layout: [GridItem]
    let missions: [Mission]
    let astronaus: [String: Astronaut]
    var body: some View {
        LazyVGrid(columns: layout) {
            ForEach(missions) { mission in
                NavigationLink(value: mission) {
                    VStack {
                        Image(mission.image)
                            .resizable()
                            .scaledToFit()
                            .frame(width: 100, height: 100)
                            .padding()
                        VStack {
                            Text(mission.displayName)
                                .font(.headline)
                                .foregroundStyle(.white)
                            Text(mission.formattedLaunchDate)
                                .font(.caption)
                                .foregroundStyle(.white.opacity(0.5))
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
                .navigationDestination(for: Mission.self, destination: { selectedMission in
                    MissionView(mission: selectedMission, astronauts: astronaus)
                })
            }
        }
        .padding([.horizontal, .bottom])
    }
}

struct CustomListMissionView: View {
    
    let layout: [GridItem]
    let missions: [Mission]
    let astronaus: [String: Astronaut]
    var body: some View {
            ForEach(missions) { mission in
                NavigationLink(value: mission) {
                    HStack() {
                        Image(mission.image)
                            .resizable()
                            .scaledToFit()
                            .frame(width: 50, height: 50)
                            .padding()
                        VStack(alignment: .leading) {
                            Text(mission.displayName)
                                .font(.headline)
                                .foregroundStyle(.white)
                            Text(mission.formattedLaunchDate)
                                .font(.caption)
                                .foregroundStyle(.white.opacity(0.5))
                        }
                        .padding(.vertical)
                        .frame(maxWidth: .infinity, alignment: .leading)
                    }
                    .background(.lightBackground)
                    .clipShape(.rect(cornerRadius: 10))
                    .overlay {
                        RoundedRectangle(cornerRadius: 10)
                            .stroke(.white)
                    }
                    .padding(.horizontal)
                }
                .frame(maxWidth: .infinity)
                .navigationDestination(for: Mission.self, destination: { selectedMission in
                    MissionView(mission: selectedMission, astronauts: astronaus)
                })
        }
        
    }
}

struct ContentView: View {
    @State private var isShowingGrid: Bool = true
    let astronaus: [String: Astronaut] = Bundle.main.decode("astronauts.json")
    let missions: [Mission] = Bundle.main.decode("missions.json")
    
    let layout = [
        GridItem(.adaptive(minimum: 120))
    ]
    
    var body: some View {
        NavigationStack {
            ScrollView {
                if isShowingGrid {
                    CustomGridMissionView(layout: layout, missions: missions, astronaus: astronaus)
                } else {
                    CustomListMissionView(layout: layout, missions: missions, astronaus: astronaus)
                }
            }
            .navigationTitle("Moonshot")
            .background(.darkBackground)
            .preferredColorScheme(.dark)
            .toolbar(content: {
                Button {
                    isShowingGrid.toggle()
                } label: {
                    Image(systemName: isShowingGrid ? "list.dash" : "square.grid.3x3.fill")
                }
            })
        }
    }
}

#Preview {
    ContentView()
}
