//
//  Data.swift
//  Quiz Savvy
//
//  Created by 青木智大 on 2020/06/29.
//  Copyright © 2020 青木智大. All rights reserved.
//

import Foundation

struct QuizStore {
    let quiz1: [Quiz] = load("quiz1.json")
    let quiz2: [Quiz] = load("quiz2.json")
}

var situationStore: [Situation] = load("situation.json")
var quizStore = QuizStore()



func load<T: Decodable>(_ filename: String, as type: T.Type = T.self) -> T {
    let data: Data
    
    guard let file = Bundle.main.url(forResource: filename, withExtension: nil)
        else {
            fatalError("Couldn't find \(filename) in main bundle.")
    }
    
    do {
        data = try Data(contentsOf: file)
    } catch {
        fatalError("Couldn't load \(filename) from main bundle:\n\(error)")
    }
    
    do {
        let decoder = JSONDecoder()
        decoder.dateDecodingStrategy = .iso8601
        return try decoder.decode(T.self, from: data)
    } catch {
        fatalError("Couldn't parse \(filename) as \(T.self):\n\(error)")
    }
}

