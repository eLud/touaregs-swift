//
//  TypesTableViewController.swift
//  Resthotels
//
//  Created by Ludovic Ollagnier on 24/05/2019.
//  Copyright © 2019 Tectec. All rights reserved.
//

import UIKit

protocol TypesTableViewControllerSelectionDelegate {

    // En général on fait l'un des deux, et pas les deux
    var selectedTypes: [RestaurantType] { get set }
    func didSelect(_ types: [RestaurantType])
}

class TypesTableViewController: UITableViewController {

    let dataSource = SimpleStringTableViewDataSource(with: RestaurantType.allRawValues)
    var selectionDelegate: TypesTableViewControllerSelectionDelegate?

    override func viewDidLoad() {
        super.viewDidLoad()
        tableView.dataSource = dataSource
        tableView.delegate = self
    }

    override func tableView(_ tableView: UITableView, didSelectRowAt indexPath: IndexPath) {

        guard let selectedIndexPaths = tableView.indexPathsForSelectedRows else { return }

        let selectedCases = selectedIndexPaths.map { (ip) -> RestaurantType in
            let row = ip.row
            let type = RestaurantType.allCases[row]
            return type
        }

//        self.navigationController?.popViewController(animated: true)

        selectionDelegate?.selectedTypes = selectedCases
        selectionDelegate?.didSelect(selectedCases)
    }

}



