//
//  MockCountryRepository.swift
//  CountriesApp
//
//  Created by Larissa Magalhaes on 2025-02-17.
//

@testable import CountriesApp

class MockCountryRepository: CountryRepositoryProtocol {
	
	var getCountriesCalled = 0
	var getCountryByNameCalled = 0
	private let countries: [Country]
	
	init(countries: [Country]) {
		self.countries = countries
	}

	func getCountries() async throws -> [Country] {
		self.getCountriesCalled += 1
		return self.countries
	}
	
	func getCountry(by name: String) async throws -> Country {
		self.getCountryByNameCalled += 1
		return self.countries.first(where: { $0.name == name })!
	}
}
