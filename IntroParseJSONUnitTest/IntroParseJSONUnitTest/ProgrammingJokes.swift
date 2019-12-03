//
//  ProgrammingJokes.swift
//  IntroParseJSONUnitTest
//
//  Created by Juan Ceballos on 12/3/19.
//  Copyright © 2019 Juan Ceballos. All rights reserved.
//

import Foundation

struct ProgrammingJokes: Decodable  {
    let id: Int
    let type: String
    let setup: String
    let punchline: String
    
    static func getJokes() -> [ProgrammingJokes]  {
        var jokes = [ProgrammingJokes]()
        
        guard let sourceURL = Bundle.main.url(forResource: "Jokes", withExtension: "json")
            else    {
                fatalError()
        }
        
        do  {
            let data = try Data(contentsOf: sourceURL)
            let jokeData = try JSONDecoder().decode([ProgrammingJokes].self, from: data)
            jokes = jokeData
        }
        catch   {
            fatalError()
        }
        return jokes
    }
}
