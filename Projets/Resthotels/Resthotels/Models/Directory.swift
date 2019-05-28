//
//  Directory.swift
//  Resthotels
//
//  Created by Ludovic Ollagnier on 28/05/2019.
//  Copyright © 2019 Tectec. All rights reserved.
//

import Foundation

class Directory {

    private var etablissements: [Etablissement]

    init() {
        etablissements = []
    }

    func populateDemoData() {

        let me = Person(firstName: "Ludovic", lastName: "Ollagnier")

        etablissements.append(Hotel(name: "Test", adress: "yruhj", nbRooms: 87, phone: "2345678", website: nil, images: [], owner: me, ranking: .fiveStars, haveSwimmingPool: true, restaurant: nil))

        etablissements.append(Restaurant(name: "McDO", adress: "Somewhere", nbTables: 54, phone: "1234567890°", website: nil, images: [], owner: me, type: [.fastFood, .american]))

        etablissements.append(Hotel(name: "Carlton", adress: "Lille", nbRooms: 87, phone: "2345678", website: nil, images: [], owner: me, ranking: .fiveStars, haveSwimmingPool: true, restaurant: nil))
    }

    func add(_ newEtablissement: Etablissement) {
        etablissements.append(newEtablissement)
    }

    var allEtablissements: [Etablissement] {
        return etablissements
    }

    var allRestaurants: [Restaurant] {
        return etablissements.compactMap { (etab) -> Restaurant? in
            return etab as? Restaurant
        }
    }

    var allHotels: [Hotel] {
        return etablissements.compactMap { (etab) -> Hotel? in
            return etab as? Hotel
        }
    }
}
