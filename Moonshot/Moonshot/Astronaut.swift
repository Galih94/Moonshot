//
//  Astronaut.swift
//  Moonshot
//
//  Created by Galih Samudra on 12/07/24.
//

import Foundation

struct Astronaut: Codable, Identifiable {
    let id: String
    let name: String
    let description: String
}

extension Bundle {
    func decode(_ file: String) -> [String: Astronaut] {
        guard let url = self.url(forResource: file, withExtension: nil) else {
            fatalError("Failed to locate \(file) in bundle")
        }
        
        guard let data = try? Data(contentsOf: url) else {
            fatalError("Failed to get data from \(url)")
        }
        
        guard let loadedData = try? JSONDecoder().decode([String: Astronaut].self, from: data) else {
            fatalError("Failed to decode data from \(url)")
        }
        
        return loadedData
    }
}
