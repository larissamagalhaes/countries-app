//
//  CountryRepository.swift
//  CountriesApp
//
//  Created by Larissa Magalhaes on 2025-02-14.
//

protocol CountryRepositoryProtocol {
	func getCountries() async throws -> [Country]
	func getCountry(by name: String) async throws -> Country
}

class CountryRepository: CountryRepositoryProtocol {

	private let remoteDataSource: CountryDataSource
	
	init(remoteDataSource: CountryDataSource) {
		self.remoteDataSource = remoteDataSource
	}
	
	func getCountries() async throws -> [Country] {
		return try await self.remoteDataSource.fetchCountries()
	}
	
	func getCountry(by name: String) async throws -> Country {
		return try await self.remoteDataSource.fetchCountry(by: name)
	}
}
