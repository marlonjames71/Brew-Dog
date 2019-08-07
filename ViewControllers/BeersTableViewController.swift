//
//  BeersTableViewController.swift
//  BrewDog
//
//  Created by Marlon Raskin on 8/6/19.
//  Copyright © 2019 Marlon Raskin. All rights reserved.
//

import UIKit

class BeersTableViewController: UITableViewController {

	let beerController = BeerController()

    override func viewDidLoad() {
        super.viewDidLoad()
		tableView.tableFooterView = UIView()
		tableView.estimatedRowHeight = 300
		tableView.rowHeight = UITableView.automaticDimension
		fetchBeers()
    }

	private func fetchBeers() {
		beerController.fetchBeers { (error) in
			if let error = error {
				print("Error fetching beers: \(error)")
				return
			}
			DispatchQueue.main.async {
				self.tableView.reloadData()
			}
		}
	}

    // MARK: - Table view data source

    override func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        return beerController.beers.count
    }


    override func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
		guard let cell = tableView.dequeueReusableCell(withIdentifier: "BeerCell", for: indexPath) as? BeerTableViewCell else { return UITableViewCell() }

		let beer = beerController.beers[indexPath.row]
		let malt = beer.ingredients.malt.first!
		let hop = beer.ingredients.hops.first!
		let yeast = beer.ingredients.yeast

		cell.beerNameLabel.text = beer.name
		cell.taglineLabel.text = beer.tagline
		cell.descriptionLabel.text = beer.description
		cell.abvLabel.text = ("\(beer.abv)")
		cell.ibuLabel.text = ("\(beer.ibu ?? 0)")
		cell.hopLabel.text = "\(hop.name)"
		cell.hopAmountLabel.text = "\(hop.amount.value) | Unit: \(hop.amount.unit)"
		cell.maltLabel.text = "\(malt.name)"
		cell.maltAmountLabel.text = "\(malt.amount.value) | Unit: \(malt.amount.unit)"
		cell.yeastLabel.text = yeast

		cell.descriptionLabel.sizeToFit()

        return cell
    }
	

    /*
    // MARK: - Navigation

    // In a storyboard-based application, you will often want to do a little preparation before navigation
    override func prepare(for segue: UIStoryboardSegue, sender: Any?) {
        // Get the new view controller using segue.destination.
        // Pass the selected object to the new view controller.
    }
    */

}
