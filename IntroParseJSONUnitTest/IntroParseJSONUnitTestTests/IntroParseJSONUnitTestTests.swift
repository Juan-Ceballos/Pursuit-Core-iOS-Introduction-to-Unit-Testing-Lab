//
//  IntroParseJSONUnitTestTests.swift
//  IntroParseJSONUnitTestTests
//
//  Created by Juan Ceballos on 12/3/19.
//  Copyright © 2019 Juan Ceballos. All rights reserved.
//

import XCTest
@testable import IntroParseJSONUnitTest

class IntroParseJSONUnitTestTests: XCTestCase {

    override func setUp() {
        // Put setup code here. This method is called before the invocation of each test method in the class.
    }

    override func tearDown() {
        // Put teardown code here. This method is called after the invocation of each test method in the class.
    }

    func testReadingJokeData()    {
        // arrange
        let filename = "Jokes"
        let ext = "json"
        
        // act
        let data = Bundle.ParseJSONData(filename: filename, ext: ext)

        
        // assert
        XCTAssertNotNil(data)
    }
    
    func testParsingJokesToTableView()   {
        let filename = "Jokes"
        let ext = "json"
        
        let data = Bundle.ParseJSONData(filename: filename, ext: ext)
        
        let jokes = ProgrammingJokes.getJokes()
        
        XCTAssertGreaterThan(jokes.count, 0)
    }
    
    func testGetFirstJoke() {
        let filename = "Jokes"
        let ext = "json"
        let data = Bundle.ParseJSONData(filename: filename, ext: ext)
        let jokes = ProgrammingJokes.getJokes()
        let expectedFirstSetUp = "There are 10 types of people in this world..."
        
        let firstSetup = jokes.first?.setup
        
        XCTAssertEqual(firstSetup, expectedFirstSetUp)
    }
    
    func testReadingSWFilmsData()   {
        let filename = "SWFilms"
        let ext = "json"
        
        let data = Bundle.ParseJSONData(filename: filename, ext: ext)
        
        XCTAssertNotNil(data)
    }
    
    func testParseFilmsToTableView()    {
        let filename = "SWFilms"
        let ext = "json"
        
        let films = SWFilmsData.getFilms()
        
        XCTAssertGreaterThan(films.count, 0)
    }
    
    func testgetFirstFilm() {
        let filename = "SWFilms"
        let ext = "json"
        let films = SWFilmsData.getFilms()
        let expectedFirstFilm = "A New Hope"
        
        let firstFilm = films.first?.title
        
        XCTAssertEqual(firstFilm, expectedFirstFilm)
    }
}
