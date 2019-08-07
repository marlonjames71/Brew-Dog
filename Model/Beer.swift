//
//  Beer.swift
//  BrewDog
//
//  Created by Marlon Raskin on 8/6/19.
//  Copyright © 2019 Marlon Raskin. All rights reserved.
//

import Foundation

enum Unit: String, Codable {
	case kilograms = "kilograms"
	case celsius = "celsius"
	case grams = "grams"
	case litres = "litres"
}

struct Beer: Codable {
	let name, tagline, description: String
	let abv: Double
	let ibu: Double?
	let ingredients: Ingredients
	let brewersTips: String?

	enum CodingKeys: String, CodingKey {
		case name, tagline, description
		case abv
		case ibu
		case ingredients
		case brewersTips = "brewers_tips"
	}
}

struct Ingredients: Codable {
	let malt: [Malt]
	let hops: [Hop]
	let yeast: String
}

struct Malt: Codable {
	let name: String
	let amount: Measure
}

struct Hop: Codable {
	let name: String
	let amount: Measure
}

struct Measure: Codable {
	let value: Double
	let unit: Unit
}


