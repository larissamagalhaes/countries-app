//
//  GetCountriesRepository.swift
//  CountriesApp
//
//  Created by Larissa Magalhaes on 2025-02-14.
//

protocol GetCountriesUseCaseProtocol {
	func execute() async throws -> [CountrySimple]
}

class GetCountriesRepository: GetCountriesUseCaseProtocol {
	
	private let repository: CountryRepositoryProtocol
	
	init(repository: CountryRepositoryProtocol = CountryRepository()) {
		self.repository = repository
	}
	
	func execute() async throws -> [CountrySimple] {
		try await self.repository.getCountries()
			.map { CountrySimple(name: $0.name, flag: $0.flagURL) }
			.sorted(by: { $0.name < $1.name })
	}
}
