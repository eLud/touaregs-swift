//
//  Person.swift
//  Resthotels
//
//  Created by Ludovic Ollagnier on 28/05/2019.
//  Copyright © 2019 Tectec. All rights reserved.
//

import Foundation

struct Person: Equatable, CustomStringConvertible, Hashable, Mappable, Codable {
    let firstName: String
    let lastName: String
    //
    //    var latitude: Double = 0
    //    var longitude: Double = 0

    var adress: String {
        //prend la lat et la long, geocode, retourne l'adresse
        return "toto"
    }


    var description: String {
        return firstName + " " + lastName
    }
}
