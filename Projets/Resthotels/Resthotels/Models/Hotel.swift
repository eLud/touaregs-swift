//
//  Hotel.swift
//  Resthotels
//
//  Created by Ludovic Ollagnier on 28/05/2019.
//  Copyright © 2019 Tectec. All rights reserved.
//

import Foundation

enum HotelRankink: Int {
    case noStar
    case oneStar
    case twoStars
    case threeStars
    case fourStars
    case fiveStars
}

struct Hotel: Etablissement {
    let name: String
    let adress: String
    var nbRooms: Int
    let phone: String
    var website: URL?
    let images: [URL]
    var owner: Person
    var ranking: HotelRankink
    var haveSwimmingPool: Bool

    var restaurant: Restaurant?

    func book() -> Reservation? {

        //if roomIsAvailable
        // then return Resevation
        // else return nil

        return Reservation()
    }
}

struct Reservation {}
