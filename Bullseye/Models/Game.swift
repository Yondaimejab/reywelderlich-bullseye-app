//
//  Game.swift
//  Bullseye
//
//  Created by joel Alcantara on 19/12/21.
//

struct Game {
    
    enum Constants {
        static let maxPointsPerRound = 100
        static let closeNumberBonus = 50
        static let exactNumberBonus = 100
    }
    
    var target: Int = Int.random(in: 1...100)
    var score: Int = 0
    var round: Int = 1
    
    func points(selection: Int) -> Int {
        let difference = abs(target - selection)
        let bonusPoints = difference == 0 ? Constants.exactNumberBonus : difference < 3 ? Constants.closeNumberBonus : 0
        let lostPoints = difference == 0 ? 0 : difference >= 50 ? 50 : 25
        return (Constants.maxPointsPerRound - lostPoints) + bonusPoints
    }
    
    mutating func startNewRound(points: Int) {
        self.score += points
        round += 1
        target = Int.random(in: 1...100)
    }
    
    mutating func restartGame() {
        score = 0
        round = 1
        target = Int.random(in: 1...100)
    }
}
