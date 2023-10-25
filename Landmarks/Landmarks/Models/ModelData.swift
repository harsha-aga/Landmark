//
//  ModelData.swift
//  Landmarks
//
//  Created by Harsha Agarwal on 25/10/23.
//

import Foundation
import Observation

@Observable class ModelData {
    var landmarks: [Landmark] = load("landmarkData.json")
}

func load<T: Decodable>(_ filename: String) -> T {

    let data: Data

    guard let url = Bundle.main.url(forResource: filename, withExtension: nil) else {
        fatalError("Couldn't find \(filename) in main bundle.")
    }

    do {
        data = try Data(contentsOf: url)
    } catch {
        fatalError("Couldn't find \(filename) in main bundle.")
    }

    do {
        let decorder = JSONDecoder()
        
        return try decorder.decode(T.self, from: data)
    } catch {
        fatalError("Couldn't find \(filename) in main bundle.")
    }
}
