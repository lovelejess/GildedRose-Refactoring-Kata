//
//  Invoice.swift
//  TheatreCompany
//
//  Created by Jess Le on 2/8/23.
//

import Foundation

struct Invoice: Codable {
    let customer: String
    let performances: [Performance]
}

struct Performance: Codable {
    let playID: String
    let audience: Int
}

typealias Invoices = [Invoice]
