//
//  ModelData.swift
//  SwiftUITutorial
//
//  Created by Cristian Abrudan on 02.06.2023.
//

import Foundation
import Combine

final class ModelData: ObservableObject {
    @Published var landmarks : [Landmark] = load("landmarkData.json")
    var hikes: [Hike] = load("hikeData.json")
}

func load<T: Decodable>(_ fileName: String) -> T {
    let data: Data
    
    guard let file = Bundle.main.url(forResource: fileName, withExtension: nil)
    else {
        fatalError("Couldn't find \(fileName) from main bundle.")
    }
    
    do {
        data = try Data(contentsOf: file)
    } catch {
        fatalError("Couldn't find \(fileName) from main bundle: \n\(error)")
    }
    
    do {
        let decoder = JSONDecoder()
        return try decoder.decode(T.self, from: data)
    } catch {
        fatalError("Coundn't parse \(fileName) as \(T.self):\n\(error)")
    }
}
