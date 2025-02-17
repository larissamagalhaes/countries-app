//
//  CountryRemoteDataSource.swift
//  CountriesApp
//
//  Created by Larissa Magalhaes on 2025-02-14.
//

/// Class responsible for fetching country data from api
class CountryRemoteDataSource: CountryDataSource {
	
	private let networkManager: NetworkManager
	
	init(networkManager: NetworkManager = .init()) {
		self.networkManager = networkManager
	}

	func fetchCountries() async throws -> [Country] {
		try await self.networkManager.request(model: [Country].self, endpoint: .all)
	}
	
	func fetchCountry(by name: String) async throws -> Country {
		guard let country = try await self.networkManager
			.request(model: [Country].self, endpoint: .name(name))
			.first else {
			throw APIError.invalidEndpoint
		}
		return country
	}
}
