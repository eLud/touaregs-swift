//
//  MemoryDemo.swift
//  Resthotels
//
//  Created by Ludovic Ollagnier on 27/05/2019.
//  Copyright © 2019 Tectec. All rights reserved.
//

import Foundation

struct CreditCard: CustomStringConvertible {

    var description: String {
        return cardNumber
    }
    let cardNumber: String
    unowned let user: User

    init(number: String, user: User) {
        cardNumber = number
        self.user = user
    }


}

class User {

    let name: String
    var card: CreditCard?

    init(name: String) {
        self.name = name
    }
}
