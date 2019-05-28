//
//  PlaceDetailsTableViewController.swift
//  Resthotels
//
//  Created by Ludovic Ollagnier on 28/05/2019.
//  Copyright © 2019 Tectec. All rights reserved.
//

import UIKit

class PlaceDetailsTableViewController: UITableViewController {

    @IBOutlet weak var placeImageView: UIImageView!
    @IBOutlet weak var placeNameLabel: UILabel!
    @IBOutlet weak var addresslabel: UILabel!

    var place: Etablissement?

    override func viewDidLoad() {
        super.viewDidLoad()

        guard place != nil else { fatalError("This screen needs a place")}
        configureUI()
        downloadImage()
    }

    private func configureUI() {
        placeImageView.image = UIImage(named: "carlton")
        placeNameLabel.text = place?.name
        addresslabel.text = place?.adress
        title = place?.name
    }

    private func downloadImage() {

        let session = URLSession.shared
        let url = URL(string: "https://developer.apple.com/discover/images/education_large_2x.jpg")

        let task = session.dataTask(with: url!) { (data, response, error) in
            if let data = data {
                print("J'ai de la data \(data)")
                let image = UIImage(data: data)
                print(image)

                //Ici on est en background
                DispatchQueue.main.async {
                    //Ici on est sur le main thread
                    self.placeImageView.image = image
                }
            } else if let error = error {
                print("J'ai une erreur \(error)")
            }
        }

        task.resume()
    }
}
