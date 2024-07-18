//
//  Mission.swift
//  Moonshot
//
//  Created by Galih Samudra on 12/07/24.
//

import Foundation


struct CrewMember {
    let role: String
    let astronaut: Astronaut
}

struct Mission: Codable, Identifiable, Hashable {
    static func == (lhs: Mission, rhs: Mission) -> Bool {
        return lhs.id == rhs.id
    }
    
    struct CrewRole: Codable, Hashable {
        let name: String
        let role: String
    }
    let id: Int
    let launchDate: Date?
    let crew: [CrewRole]
    let description: String
    
    var displayName: String {
        return "Apollo \(id)"
    }
    
    var image: String {
        return "apollo\(id)"
    }
    
    var formattedLaunchDate: String {
        return launchDate?.formatted(date: .abbreviated, time: .omitted) ?? "N/A"
    }
}
