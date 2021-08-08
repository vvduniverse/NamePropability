//
//  Name.swift
//  NamePropability
//
//  Created by Vahtee Boo on 08.08.2021.
//

import Foundation

struct NameProbability: Codable {
    let name: String?
    let country: [Country]?
}

struct Country: Codable {
    let countryID: String?
    let probability: Double?
    
    enum CodingKeys: String, CodingKey {
        case countryID = "country_id"
        case probability
    }
}

