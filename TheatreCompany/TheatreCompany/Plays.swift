//
//  Plays.swift
//  TheatreCompany
//
//  Created by Jess Le on 2/8/23.
//

import Foundation

struct Plays: Codable {
    let play: Play
}

struct Play: Codable {
    let name: String
    let type: String
}
