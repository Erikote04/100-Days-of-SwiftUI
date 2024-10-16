//
//  Bundle+Decodable.swift
//  Moonshot
//
//  Created by Erik Sebastian de Erice Jerez on 16/10/24.
//

import Foundation

extension Bundle {
    func decode(_ file: String) -> [String: Astronaut] {
        guard let url = url(forResource: file, withExtension: nil) else {
            fatalError("Could not find \(file) in bundle.")
        }
        
        guard let data = try? Data(contentsOf: url) else {
            fatalError("Could not read \(file) from bundle.")
        }
        
        do {
            return try JSONDecoder().decode([String: Astronaut].self, from: data)
        } catch DecodingError.keyNotFound(let key, let context) {
                fatalError("Failed to decode \(file) from bundle due to missing key '\(key)' - \(context)")
        } catch DecodingError.typeMismatch(_, let context) {
            fatalError("Failed to decode \(file) from bundle due to type mismatch - \(context.debugDescription)")
        } catch DecodingError.valueNotFound(let type, let context) {
            fatalError("Failed to decode \(file) from bundle due to missing '\(type)' value - \(context.debugDescription)")
        } catch DecodingError.dataCorrupted(let context) {
            fatalError("Failed to decode \(file) from bundle due to data corruption - \(context.debugDescription)")
        } catch {
            fatalError("Failed to decode \(file) from bundle: \(error.localizedDescription)")
        }
    }
}
