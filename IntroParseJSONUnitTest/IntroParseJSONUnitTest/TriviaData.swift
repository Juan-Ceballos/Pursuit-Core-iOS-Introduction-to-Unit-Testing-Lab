//
//  TriviaData.swift
//  IntroParseJSONUnitTest
//
//  Created by Juan Ceballos on 12/3/19.
//  Copyright © 2019 Juan Ceballos. All rights reserved.
//

import Foundation

struct TriviaData: Decodable    {
    let results: [Trivia]
}

struct Trivia: Decodable    {
    let question: String
    let correctAnswer: String
    let incorrectAnswers: [String]
    
    enum CodingKeys: String, CodingKey  {
        case question
        case correctAnswer = "correct_answer"
        case incorrectAnswers = "incorrect_answers"
    }
}

extension TriviaData    {
    static func getTrivia() -> [Trivia]   {
        var trivias = [Trivia]()
        
        guard let sourceURL = Bundle.main.url(forResource: "Trivia", withExtension: "json")
            else    {
                fatalError()
        }
        
        do  {
            let data = try Data.init(contentsOf: sourceURL)
            let parseTrivia = try JSONDecoder().decode(TriviaData.self, from: data)
            
            trivias = parseTrivia.results
        }
        
        catch   {
            fatalError()
        }
        return trivias
    }
}
