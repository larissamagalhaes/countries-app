//
//  CountryRepository.swift
//  CountriesApp
//
//  Created by Larissa Magalhaes on 2025-02-14.
//


/// A protocol defining methods for accessing country data from a repository.
protocol CountryRepositoryProtocol {
	/// Retrieves a list of all countries.
	///
	/// - Returns: An array of `Country` objects.
	///
	/// - Throws: An error if data retrieval or decoding fails.
	func getCountries() async throws -> [Country]
	
	/// Retrieves a specific country by its name.
	///
	/// - Parameter name: The name of the country to retrieve.
	/// - Returns: A `Country` object corresponding to the provided name.
	///
	/// - Throws: An error if data retrieval or decoding fails.
	func getCountry(by name: String) async throws -> Country
}

class CountryRepository: CountryRepositoryProtocol {

	private let remoteDataSource: CountryDataSource
	
	init(remoteDataSource: CountryDataSource = CountryRemoteDataSource()) {
		self.remoteDataSource = remoteDataSource
	}
	
	func getCountries() async throws -> [Country] {
		return try await self.remoteDataSource.fetchCountries()
	}
	
	func getCountry(by name: String) async throws -> Country {
		return try await self.remoteDataSource.fetchCountry(by: name)
	}
}
