//
//  CountryRemoteDataSource.swift
//  CountriesApp
//
//  Created by Larissa Magalhaes on 2025-02-14.
//

class CountryRemoteDataSource: CountryDataSource {
	
	private let networkManager: NetworkManager
	
	init(networkManager: NetworkManager = .init()) {
		self.networkManager = networkManager
	}

	func fetchCountries() async throws -> [Country] {
		try await self.networkManager.request(model: [Country].self, endpoint: .all)
	}
	
	func fetchCountry(by name: String) async throws -> Country {
		try await self.networkManager.request(model: Country.self, endpoint: .name(name))
	}
}
