//
//  Endpoint.swift
//  CountriesApp
//
//  Created by Larissa Magalhaes on 2025-02-14.
//

import Foundation

enum Endpoint {
	case all
	case name(String)
	
	var url: URL {
		var urlComponents = URLComponents(string: "\(self.baseURL)\(self.path)")
		urlComponents?.queryItems = self.parameters
		guard let url = urlComponents?.url else {fatalError("Error creating url")  }
		return url
	}
	
	private var baseURL: URL {
		guard let url = URL(string: "https://restcountries.com/v3.1/") else { fatalError("Error in baseURL") }
		return url
	}
	
	private var path: String {
		switch self {
		case .all:
			return "all"
		case .name(let string):
			return "name/\(string)"
		}
	}
	
	private var parameters: [URLQueryItem] {
		switch self {
		case .all:
			return [URLQueryItem(name: "fields", value: "name,flags")]
		case .name:
			return [URLQueryItem(name: "fields", value: "flags,population,capital,name,continents")]
		}
	}
}
