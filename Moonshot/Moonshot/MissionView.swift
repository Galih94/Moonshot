//
//  MissionView.swift
//  Moonshot
//
//  Created by Galih Samudra on 15/07/24.
//

import SwiftUI

struct MissionView: View {
    let crewMember: [CrewMember]
    let mission: Mission
    init(mission: Mission, astronauts: [String: Astronaut]) {
        self.mission = mission
        self.crewMember = mission.crew.map{ member in
            if let astronaut = astronauts[member.name] {
                
                return CrewMember(role: member.role, astronaut: astronaut)
            }
            fatalError("missing \(member.name)")
        }
    }
    
    var body: some View {
        ScrollView {
            VStack {
                Image(mission.image)
                    .resizable()
                    .scaledToFit()
                    .containerRelativeFrame(.horizontal) { width, axis in
                        width * 0.6
                    }
                    .padding(.top)
                VStack(alignment: .leading) {
                    Text("Mission Highlights")
                        .font(.title.bold())
                        .padding(.bottom, 5)
                    Text(mission.description)
                    
                }
                .padding(.horizontal)
            }
            .padding(.bottom)
        }
        .navigationTitle(mission.displayName)
        .navigationBarTitleDisplayMode(.inline)
        .background(.darkBackground)
    }
}

#Preview {
    let mission: [Mission] = Bundle.main.decode("missions.json")
    let astronauts: [String: Astronaut] = Bundle.main.decode("astronauts.json")
    return MissionView(mission: mission[3], astronauts: astronauts).preferredColorScheme(.dark)
}
