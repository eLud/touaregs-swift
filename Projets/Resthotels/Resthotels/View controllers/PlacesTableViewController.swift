//
//  PlacesTableViewController.swift
//  Resthotels
//
//  Created by Ludovic Ollagnier on 27/05/2019.
//  Copyright © 2019 Tectec. All rights reserved.
//

import UIKit

class PlacesTableViewController: UITableViewController {

    let directory = Directory()

    override func viewDidLoad() {
        super.viewDidLoad()

        DispatchQueue.global(qos: .userInteractive).async {
            for i in 0...1000000 {
                print(i)
            }
        }


        directory.populateDemoData()
    }

    override func numberOfSections(in tableView: UITableView) -> Int {
        return 2
    }

    override func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {

        switch section {
        case 0:
            return directory.allHotels.count
        case 1:
            return directory.allRestaurants.count
        default:
            return 0
        }
    }

    override func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {

        let cell: UITableViewCell

        switch indexPath.section {
        case 0:
            let hotel = directory.allHotels[indexPath.row]
            cell = tableView.dequeueReusableCell(withIdentifier: "hotelCell", for: indexPath)

            let hotelCell = cell as! HotelTableViewCell
            hotelCell.hotelName.text = hotel.name
            hotelCell.hotelAddress.text = hotel.adress
            hotelCell.hotelImageView.image = UIImage(named: "diablo")
            hotelCell.hotelRanking.text = "\(hotel.ranking.rawValue) ⭐️"

        case 1:
            let resto = directory.allRestaurants[indexPath.row]
            cell = tableView.dequeueReusableCell(withIdentifier: "restoCell", for: indexPath)
            cell.textLabel?.text = resto.name
            cell.detailTextLabel?.text = resto.adress
        default:
            fatalError()
        }

        return cell
    }

    override func tableView(_ tableView: UITableView, titleForHeaderInSection section: Int) -> String? {
        switch section {
        case 0:
            return "Hotels"
        case 1:
            return "Restaurants"
        default:
            fatalError("Only 2 sections")
        }
    }

    override func prepare(for segue: UIStoryboardSegue, sender: Any?) {

        if segue.identifier == "showDetails" {
            guard let destination = segue.destination as? PlaceDetailsTableViewController else { fatalError("Destination for showDetails segue must be a PlaceDetailsTableViewController") }
            guard let indexPath = tableView.indexPathForSelectedRow else { return }

            switch indexPath.section {
            case 0:
                let hotel = directory.allHotels[indexPath.row]
                destination.place = hotel
            case 1:
                let resto = directory.allRestaurants[indexPath.row]
                destination.place = resto
            default:
                fatalError()
            }
        }
    }
}
