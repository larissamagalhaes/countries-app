//
//  GetCountryUseCase.swift
//  CountriesApp
//
//  Created by Larissa Magalhaes on 2025-02-14.
//

/// A protocol that defines the use case for retrieving detailed information about a country.
///
/// Implementers of this protocol are responsible for fetching country-specific details,
/// which may come from a remote service, local database, or other sources.
protocol GetCountryUseCaseProtocol {
	/// Retrieves detailed information about a country.
	///
	/// - Returns: A `CountryDetail` object containing information about the country.
	/// - Throws: An error if the operation fails.
	func execute() async throws -> CountryDetail
}

class GetCountryUseCase: GetCountryUseCaseProtocol {
	
	private let repository: CountryRepositoryProtocol
	private let name: String
	
	init(name: String, repository: CountryRepositoryProtocol = CountryRepository()) {
		self.repository = repository
		self.name = name
	}
	
	func execute() async throws -> CountryDetail {
		let country = try await repository.getCountry(by: self.name)
		return CountryDetail(name: country.name,
							 capital: country.capitals.joined(separator: ", "),
							 continent: country.continents.joined(separator: ", "),
							 flag: country.flagURL,
							 population: "\(country.population)")
	}
}
