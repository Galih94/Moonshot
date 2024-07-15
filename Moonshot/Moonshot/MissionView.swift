//
//  MissionView.swift
//  Moonshot
//
//  Created by Galih Samudra on 15/07/24.
//

import SwiftUI

struct MissionView: View {
    let mission: Mission
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
    MissionView(mission: Mission(id: 10, launchDate: Date(), crew: [Mission.CrewRole(name: "stafford", role: "Commander")], description: "Apollo 10 was a May 1969 human spaceflight, the fourth crewed mission in the United States Apollo program, and the second (after Apollo 8) to orbit the Moon.\n\nIt was the F mission: a \"dress rehearsal\" for the first Moon landing, testing all of the components and procedures, just short of actually landing. The Apollo Lunar Module (LM) was flown to a descent orbit within 8.4 nautical miles (15.6 km) of the lunar surface, at the point where powered descent for landing would normally begin.\n\nAfter orbiting the Moon 31 times Apollo 10 returned safely to Earth, and its success enabled the first landing to be attempted on the Apollo 11 mission two months later."))
}
