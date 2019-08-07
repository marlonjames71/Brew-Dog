//
//  BeerController.swift
//  BrewDog
//
//  Created by Marlon Raskin on 8/6/19.
//  Copyright © 2019 Marlon Raskin. All rights reserved.
//

import Foundation


class BeerController {

	var beers: [Beer] = []

	let baseURL = URL(string: "https://api.punkapi.com/v2/beers")!

	enum HTTPMethod: String {
		case get = "GET"
		case put = "PUT"
		case post = "POST"
		case delet = "DELETE"
	}

	func fetchBeers(completion: @escaping(Error?) -> Void) {
		let components = URLComponents(url: baseURL, resolvingAgainstBaseURL: true)

		guard let requestURL = components?.url else {
			NSLog("Request URL is nil")
			completion(nil)
			return
		}

		var request = URLRequest(url: requestURL)
		request.httpMethod = HTTPMethod.get.rawValue

		URLSession.shared.dataTask(with: request) { (data, _, error) in
			if let error = error {
				print("Error fetching data \(error)")
				completion(error)
				return
			}

			guard let data = data else {
				completion(NSError())
				return
			}

			let jsonDecoder = JSONDecoder()
			do {
				let beerResults = try jsonDecoder.decode([Beer].self, from: data)
				self.beers = beerResults
				completion(nil)
			} catch {
				NSLog("Error decoding data: \(error)")
				completion(error)
			}
		}
		.resume()
	}
}
