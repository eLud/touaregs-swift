//
//  TypesTableViewController.swift
//  Resthotels
//
//  Created by Ludovic Ollagnier on 24/05/2019.
//  Copyright © 2019 Tectec. All rights reserved.
//

import UIKit

class TypesTableViewController: UITableViewController {

    let tab = [RestaurantType.japanese]

    let dataSource = SimpleStringTableViewDataSource(with: ["Toto", "Titi"])

    override func viewDidLoad() {
        super.viewDidLoad()

        tableView.dataSource = dataSource
    }

}



