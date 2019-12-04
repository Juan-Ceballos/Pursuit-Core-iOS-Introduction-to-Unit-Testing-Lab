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
        let jokes = ProgrammingJokes.getJokes()
        
        XCTAssertGreaterThan(jokes.count, 0)
    }
    
    func testGetFirstJoke() {
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
        let films = SWFilmsData.getFilms()
        
        XCTAssertGreaterThan(films.count, 0)
    }
    
    func testgetFirstFilm() {
        let films = SWFilmsData.getFilms()
        let expectedFirstFilm = "A New Hope"
        
        let firstFilm = films.first?.title
        
        XCTAssertEqual(firstFilm, expectedFirstFilm)
    }
    
    func testTriviaData()   {
        let filename = "Trivia"
        let ext = "json"
        let data = Bundle.ParseJSONData(filename: filename, ext: ext)
        
        XCTAssertNotNil(data)
    }
    
    func testParseTriviaToTableView()   {
        let trivias = TriviaData.getTrivia()
        
        XCTAssertGreaterThan(trivias.count, 0)
    }
    
    func testFirstQuestion()    {
        let trivias = TriviaData.getTrivia()
        let expectedFirstQuestion = "What%20is%20the%20chemical%20makeup%20of%20water%3F"
        
        let firstQuestion = trivias.first?.question
        
        XCTAssertEqual(expectedFirstQuestion, firstQuestion)
    }
}
