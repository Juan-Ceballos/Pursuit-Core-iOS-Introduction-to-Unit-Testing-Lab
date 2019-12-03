//
//  SWFilms.swift
//  IntroParseJSONUnitTest
//
//  Created by Juan Ceballos on 12/3/19.
//  Copyright © 2019 Juan Ceballos. All rights reserved.
//

import Foundation

struct SWFilmsData: Decodable   {
    let results: [SWFilms]
}

struct SWFilms: Decodable {
    let title: String
    let openingCrawl: String
   
    enum CodingKeys: String, CodingKey  {
        case title
        case openingCrawl = "opening_crawl"
    }
}

extension SWFilmsData   {
    static func getFilms() -> [SWFilms] {
        var films = [SWFilms]()
        
        guard let sourceURL = Bundle.main.url(forResource: "SWFilms", withExtension: "json")
            else {
                fatalError()
        }
        
        do  {
            let data = try Data(contentsOf: sourceURL)
            let swFilmData = try JSONDecoder().decode(SWFilmsData.self, from: data)
            
            films = swFilmData.results
        }
        catch   {
            fatalError()
        }
        return films
    }
}


