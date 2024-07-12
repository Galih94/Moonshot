//
//  Mission.swift
//  Moonshot
//
//  Created by Galih Samudra on 12/07/24.
//

import Foundation

struct CrewRole: Codable {
    let name: String
    let role: String
}

struct Mission: Codable, Identifiable {
    let id: Int
    let launchDate: String?
    let crew: [CrewRole]
    let description: String
}
