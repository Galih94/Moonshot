//
//  Bundle+Extension.swift
//  Moonshot
//
//  Created by Galih Samudra on 12/07/24.
//

import Foundation


extension Bundle {
    func decode<T: Codable>(_ file: String) -> T {
        guard let url = self.url(forResource: file, withExtension: nil) else {
            fatalError("Failed to locate \(file) in bundle")
        }
        
        guard let data = try? Data(contentsOf: url) else {
            fatalError("Failed to get data from \(url)")
        }
        
        let decoder = JSONDecoder()
        let formatter = DateFormatter()
        formatter.dateFormat = "y-MM-dd"
        decoder.dateDecodingStrategy = .formatted(formatter)
        
        do {
            let loadedData = try decoder.decode(T.self, from: data)
            return loadedData
        } catch DecodingError.keyNotFound(let key, let context){
            fatalError("Failed due to key \(key.stringValue) not found - \(context.debugDescription)")
        } catch DecodingError.typeMismatch(let type, let context){
            fatalError("Failed due to type \(type.self) mismatch - \(context.debugDescription)")
        } catch DecodingError.valueNotFound(let value, let context){
            fatalError("Failed due to value \(value.self) not found - \(context.debugDescription)")
        } catch DecodingError.dataCorrupted(let context){
            fatalError("Failed due to data corrupted - \(context.debugDescription)")
        } catch {
            fatalError("Failed to decode \(file) from bundle \(error.localizedDescription)")
        }
    }
}
