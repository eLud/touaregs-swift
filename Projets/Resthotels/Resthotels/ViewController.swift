//
//  ViewController.swift
//  Resthotels
//
//  Created by Ludovic Ollagnier on 23/05/2019.
//  Copyright © 2019 Tectec. All rights reserved.
//

import UIKit

//Equatable: égalite
//Comparable : comparaison
//CustomStringConvertible : print
//Codable : transformation en JSON/XML
//Hashable

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

protocol Mappable {
    var adress: String { get }
}

struct Person: Equatable, CustomStringConvertible, Hashable, Mappable {
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

enum RestaurantType: String {
    case italian = "Italien"
    case french
    case american
    case indian
    case japanese
    case chinese
    case fastFood
    case lebanese
    case vegan
}

enum HotelRankink: Int {
    case noStar
    case oneStar
    case twoStars
    case threeStars
    case fourStars
    case fiveStars
}

struct Hotel {
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

class ViewController: UIViewController {

    @IBOutlet weak var placeTypeSegmentedControl: UISegmentedControl!
    @IBOutlet weak var nameTextField: UITextField!
    @IBOutlet weak var addressTextField: UITextField!
    @IBOutlet weak var numberOfSlider: UISlider!
    @IBOutlet weak var phoneNumberTextField: UITextField!
    @IBOutlet weak var websiteTextField: UITextField!
    @IBOutlet weak var rankingStepper: UIStepper!
    @IBOutlet weak var haveSwimmingPoolSwitch: UISwitch!

    override func viewDidLoad() {
        super.viewDidLoad()
        // Do any additional setup after loading the view.

    }

    @IBAction func save(_ sender: UIButton) {

        switch placeTypeSegmentedControl.selectedSegmentIndex {
        case 0:
            print(saveResto())
//            fallthrough
        case 1:
            print(saveHotel())
        default:
            fatalError("We only handle 2 segments")
        }

    }

    private func saveResto() -> Restaurant? {

        var url: URL? = nil
        if let urlString = websiteTextField.text {
            url = URL(string: urlString)
        }

        if let name = nameTextField.text,
            let address = addressTextField.text,
            let phoneNumber = phoneNumberTextField.text {

            let myResto = Restaurant(name: name, adress: address, nbTables: Int(numberOfSlider.value), phone: phoneNumber, website: url, images: [], owner: Person(firstName: "Ludovic", lastName: "Ollagnier"), type: [])

            return myResto
        } else {
            return nil
        }
    }

    private func saveHotel() -> Hotel? {

        guard let name = nameTextField.text else { return nil }
        guard let address = addressTextField.text else { return nil }
        guard let phoneNumber = phoneNumberTextField.text else { return nil }
        guard let ranking = HotelRankink(rawValue: Int(rankingStepper.value)) else { return nil }

        var url: URL?
        if let urlString = websiteTextField.text, let realUrl = URL(string: urlString) {
            url = realUrl
        }

        let myHotel = Hotel(name: name, adress: address, nbRooms: Int(numberOfSlider.value), phone: phoneNumber, website: url, images: [], owner: Person(firstName: "Ludovic", lastName: "Ollagnier"), ranking: ranking, haveSwimmingPool: haveSwimmingPoolSwitch.isOn, restaurant: nil)

        return myHotel
    }
}

