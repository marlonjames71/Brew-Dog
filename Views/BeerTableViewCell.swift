//
//  BeerTableViewCell.swift
//  BrewDog
//
//  Created by Marlon Raskin on 8/6/19.
//  Copyright © 2019 Marlon Raskin. All rights reserved.
//

import UIKit

class BeerTableViewCell: UITableViewCell {


	@IBOutlet weak var beerNameLabel: UILabel!
	@IBOutlet weak var taglineLabel: UILabel!
	@IBOutlet weak var descriptionLabel: UILabel!
	@IBOutlet weak var abvLabel: UILabel!
	@IBOutlet weak var ibuLabel: UILabel!
	@IBOutlet weak var maltLabel: UILabel!
	@IBOutlet weak var hopLabel: UILabel!
	@IBOutlet weak var yeastLabel: UILabel!
	@IBOutlet weak var maltAmountLabel: UILabel!
	@IBOutlet weak var hopAmountLabel: UILabel!

    override func awakeFromNib() {
        super.awakeFromNib()
        // Initialization code
    }

    override func setSelected(_ selected: Bool, animated: Bool) {
        super.setSelected(selected, animated: animated)

        // Configure the view for the selected state
    }

}
