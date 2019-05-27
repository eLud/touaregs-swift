//
//  SimpleStringTableViewDataSource.swift
//  Resthotels
//
//  Created by Ludovic Ollagnier on 27/05/2019.
//  Copyright © 2019 Tectec. All rights reserved.
//

import UIKit

class SimpleStringTableViewDataSource: NSObject, UITableViewDataSource {

    var strings: [String]

    init(with strings: [String]) {
        self.strings = strings
    }

    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        return strings.count
    }

    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        let cell = tableView.dequeueReusableCell(withIdentifier: "restoTypeCell", for: indexPath)

        // Configure the cell...
        cell.textLabel?.text = strings[indexPath.row]

        return cell
    }
}
