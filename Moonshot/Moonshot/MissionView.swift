//
//  MissionView.swift
//  Moonshot
//
//  Created by Galih Samudra on 15/07/24.
//

import SwiftUI

struct CustomDividerView: View {
    var body: some View {
        Rectangle()
            .frame(height: 2)
            .foregroundStyle(.lightBackground)
            .padding(.vertical)
    }
}

struct MissionCrewMemberView: View {
    let crewMember: [CrewMember]
    var body: some View {
        ScrollView(.horizontal, showsIndicators: false) {
            HStack {
                ForEach(crewMember, id: \.role) { crew in
                    NavigationLink {
                        AstronautView(astronaut: crew.astronaut)
                    } label: {
                        HStack {
                            Image(crew.astronaut.id)
                                .resizable()
                                .frame(width: 104, height: 72)
                                .clipShape(.capsule)
                                .overlay {
                                    Capsule()
                                        .strokeBorder(.white, lineWidth: 1)
                                }
                            VStack(alignment: .leading) {
                                Text(crew.astronaut.name)
                                    .foregroundStyle(.white)
                                    .font(.headline)
                                Text(crew.role)
                                    .foregroundStyle(.white.opacity(0.5))
                            }
                        }
                    }
                }
            }
        }
    }
}

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
                CustomDividerView()
                VStack(alignment: .leading) {
                    Text("Crew")
                        .font(.title.bold())
                        .padding(.bottom, 5)
                    MissionCrewMemberView(crewMember: crewMember)
                }
                .padding(.horizontal)
                CustomDividerView()
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
