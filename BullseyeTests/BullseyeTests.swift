//
//  BullseyeTests.swift
//  BullseyeTests
//
//  Created by joel Alcantara on 19/12/21.
//

import XCTest
@testable import Bullseye

class BullseyeTests: XCTestCase {
    
    var game: Game!
    var sliderValue: Int!

    override func setUpWithError() throws {
        // Put setup code here. This method is called before the invocation of each test method in the class.
        game = Game()
    }

    override func tearDownWithError() throws {
        // Put teardown code here. This method is called after the invocation of each test method in the class.
        game = nil
    }

    func test_pointsEvaluation() throws {
        sliderValue = game.target + 5
        XCTAssertEqual(game.points(selection: sliderValue), 75)
    }
    
    func test_scorePositive() {
        sliderValue = game.target - 10
        XCTAssertEqual(game.points(selection: sliderValue), 75)
    }
    
    func test_newRound() {
        game.startNewRound(points: 100)
        XCTAssertEqual(game.score, 100)
        XCTAssertEqual(game.round, 2)
    }

    func test_scoreExact() {
        let guess = game.target
        let score = game.points(selection: guess)
        XCTAssertEqual(score, Game.Constants.maxPointsPerRound + Game.Constants.exactNumberBonus)
    }
    
    func test_scoreClose() {
        let guess = game.target + 2
        let score = game.points(selection: guess)
        XCTAssertEqual(score, Game.Constants.maxPointsPerRound - 25 + Game.Constants.closeNumberBonus)
    }
    
    func test_restartGame() {
        let guess = game.target + 2
        let score = game.points(selection: guess)
        game.startNewRound(points: score)
        XCTAssertEqual(game.round, 2)
        XCTAssertEqual(game.score, score)
        game.restartGame()
        XCTAssertEqual(game.round, 1)
        XCTAssertEqual(game.score, 0)
    }
}
