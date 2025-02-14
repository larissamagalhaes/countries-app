//
//  GetCountryUseCase.swift
//  CountriesApp
//
//  Created by Larissa Magalhaes on 2025-02-14.
//

protocol GetCountryUseCaseProtocol {
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
