//
//  HotelTableViewCell.swift
//  Resthotels
//
//  Created by Ludovic Ollagnier on 28/05/2019.
//  Copyright © 2019 Tectec. All rights reserved.
//

import UIKit

class HotelTableViewCell: UITableViewCell {

    @IBOutlet weak var hotelImageView: UIImageView!
    @IBOutlet weak var hotelName: UILabel!
    @IBOutlet weak var hotelAddress: UILabel!
    @IBOutlet weak var hotelRanking: UILabel!

    override func awakeFromNib() {
        super.awakeFromNib()
        // Initialization code
    }

    override func setSelected(_ selected: Bool, animated: Bool) {
        super.setSelected(selected, animated: animated)

        // Configure the view for the selected state
    }

}
