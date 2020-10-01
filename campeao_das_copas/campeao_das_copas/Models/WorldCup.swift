//
//  WorldCup.swift
//  campeao_das_copas
//
//  Created by Convidado on 03/08/20.
//  Copyright © 2020 Convidado. All rights reserved.
//

import Foundation

struct WorldCup : Codable {
    let year: Int?
    let country: String
    let winner: String
    let vice: String
    let winnerScore: String
    let viceScore: String
    let matches: [Match]
    
}

struct Games : Codable {
    let home: String
    let away:  String
    let score: String
    let date: String
}

struct Match : Codable {
    let stage: String
    let games: [Games]
}
