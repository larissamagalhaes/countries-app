//
//  Country.swift
//  CountriesApp
//
//  Created by Larissa Magalhaes on 2025-02-14.
//

struct Country: Decodable, Equatable {
	let name: String
	let flagURL: String
	let capitals: [String]
	let population: Int
	let continents: [String]
	
	init(from decoder: any Decoder) throws {
		let container = try decoder.container(keyedBy: CodingKeys.self)
		
		self.name = try container.decode(NameResponse.self, forKey: .name).common
		self.flagURL = try container.decode(FlagResponse.self, forKey: .flags).png
		self.capitals = try container.decodeIfPresent([String].self, forKey: .capital) ?? []
		self.continents = try container.decodeIfPresent([String].self, forKey: .continents) ?? []
		self.population = try container.decodeIfPresent(Int.self, forKey: .population) ?? 0
	}
}

extension Country {
	enum CodingKeys: String, CodingKey {
		case name
		case flags
		case capital
		case population
		case continents
	}
}

struct NameResponse: Codable, Equatable {
	let common: String
}

struct FlagResponse: Codable, Equatable {
	let png: String
}
