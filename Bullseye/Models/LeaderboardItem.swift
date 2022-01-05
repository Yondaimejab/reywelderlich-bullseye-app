//
//  LeaderboardItem.swift
//  Bullseye
//
//  Created by joel Alcantara on 30/12/21.
//

import Foundation
import SwiftUI

struct LeaderboardItem: Identifiable {
    var id: String = UUID().uuidString
    var playerName: String
    var score: Int
    var date: Date
    
    static let list: [LeaderboardItem] = {
        return [
            LeaderboardItem(playerName: "Joel", score: 200, date: Date()),
            LeaderboardItem(playerName: "Enmanuel", score: 200, date: Date().advanced(by: -2000000)),
            LeaderboardItem(playerName: "Ariel", score: 200, date: Date().advanced(by: -23000000)),
            LeaderboardItem(playerName: "Nicolle", score: 200, date: Date().advanced(by: -4000000)),
            LeaderboardItem(playerName: "Joel", score: 200, date: Date().advanced(by: -12000000))
        ]
    }()
}

