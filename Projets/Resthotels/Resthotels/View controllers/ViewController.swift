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

class ViewController: UIViewController {

    var selectedTypes: [RestaurantType] = []

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

//        demoMemoryLeak()
        codableDemo()


    }

    //Est executé juste avant la transition pilotée par le segue
    override func prepare(for segue: UIStoryboardSegue, sender: Any?) {
        if segue.identifier == "showTypes" {
            guard let destination = segue.destination as? TypesTableViewController else { fatalError("Bad destination") }
            destination.selectionDelegate = self
        }
    }

    @IBAction func cancel(_ sender: UIBarButtonItem) {
        dismiss(animated: true, completion: nil)
    }

    @IBAction func save(_ sender: UIBarButtonItem) {

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

    private func demoMemoryLeak() {

        for _ in 0...1000000 {
            let user = User(name: "Bill Gates")
            user.card = CreditCard(number: "123456789", user: user)

            print(user.card?.cardNumber)
        }
    }

    private func userDefaultsDemo() {
        let prefs = UserDefaults.standard
        //        prefs.set("Test", forKey: "test")
        let readData = prefs.string(forKey: "name_preference")
        print(readData)
    }

    private func codableDemo() {

        let family = [Person(firstName: "Papa", lastName: "Ours"), Person(firstName: "Maman", lastName: "Ours"), Person(firstName: "Bébé", lastName: "Ours")]

        let jsonEncoder = JSONEncoder()
        let jsonData = try! jsonEncoder.encode(family)
        print(String(data: jsonData, encoding: .utf8)!)

        let jsonDecoder = JSONDecoder()
        let decodedFamily = try! jsonDecoder.decode([Person].self, from: jsonData)
        print(decodedFamily)
    }
}

extension ViewController: TypesTableViewControllerSelectionDelegate {

    func didSelect(_ types: [RestaurantType]) {
        selectedTypes = types

        print("Reçu \(types)")
    }
}
