//
//  Restaurant.swift
//  Resthotels
//
//  Created by Ludovic Ollagnier on 24/05/2019.
//  Copyright © 2019 Tectec. All rights reserved.
//

import Foundation

struct Restaurant: Equatable, Etablissement, Mappable {

    let name: String
    let adress: String
    var nbTables: Int
    let phone: String
    var website: URL?
    let images: [URL]
    var owner: Person
    var type: Set<RestaurantType>

    static func == (lhs: Restaurant, rhs: Restaurant) -> Bool {
        return lhs.name == rhs.name && lhs.adress == rhs.adress
    }
}

enum RestaurantType: String, CaseIterable {
    case italian = "Italien"
    case french
    case american
    case indian
    case japanese
    case chinese
    case fastFood
    case lebanese
    case vegan

    static var allRawValues: [String] {
        return RestaurantType.allCases.map { (type) -> String in
            return type.rawValue
        }
    }
}
