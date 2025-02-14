//
//  Country.swift
//  CountriesApp
//
//  Created by Larissa Magalhaes on 2025-02-14.
//

struct Country: Codable {
	let name: String
	let flagURL: String
	
	init(from decoder: any Decoder) throws {
		let container = try decoder.container(keyedBy: CodingKeys.self)
		
		self.name = try container.decode(NameResponse.self, forKey: .name).common
		self.flagURL = try container.decode(FlagResponse.self, forKey: .flagURL).png
	}
}

extension Country {
	enum CodingKeys: String, CodingKey {
		case name
		case flagURL = "flags"
	}
}

struct NameResponse: Codable {
	let common: String
}

struct FlagResponse: Codable {
	let png: String
}
