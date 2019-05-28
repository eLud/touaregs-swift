//
//  Etablissement.swift
//  Resthotels
//
//  Created by Ludovic Ollagnier on 28/05/2019.
//  Copyright © 2019 Tectec. All rights reserved.
//

import Foundation

protocol Etablissement: Mappable {
    var name: String { get }
    var website: URL? { get set }

    func book() -> Reservation?
}

extension Etablissement {

    func book() -> Reservation? {
        return nil
    }
}
