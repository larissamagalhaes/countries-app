//
//  GetCountriesUseCase.swift
//  CountriesApp
//
//  Created by Larissa Magalhaes on 2025-02-14.
//

/// A protocol that defines the use case for retrieving a list of countries.
protocol GetCountriesUseCaseProtocol {
	/// Retrieves a list of countries.
	///
	/// - Returns: An observable sequence emitting a list of countries or an error if the operation fails.
	func execute() async throws -> [CountrySimple]
}

class GetCountriesUseCase: GetCountriesUseCaseProtocol {
	
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
