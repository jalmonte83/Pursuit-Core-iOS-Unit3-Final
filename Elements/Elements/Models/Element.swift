//
//  Element.swift
//  Elements
//
//  Created by Jeffrey Almonte on 1/4/19.
//  Copyright © 2019 Pursuit. All rights reserved.
//

import Foundation


struct ElementInfo: Codable {
    let name: String
    let weight: Double
    let boil: Double?
    let discoveredBy: String?
    let melt: Double?
    let number: Int
    let symbol: String
    
    private enum CodingKeys: String, CodingKey {
        case name
        case weight = "atomic_mass"
        case boil
        case discoveredBy = "discovered_by"
        case melt
        case number
        case symbol
    }
}
   
