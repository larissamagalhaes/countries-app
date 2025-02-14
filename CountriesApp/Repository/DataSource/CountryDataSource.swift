//
//  CountryDataSource.swift
//  CountriesApp
//
//  Created by Larissa Magalhaes on 2025-02-14.
//

protocol CountryDataSource {
	func fetchCountries() async throws -> [Country]
	func fetchCountry(by name: String) async throws -> Country
}
