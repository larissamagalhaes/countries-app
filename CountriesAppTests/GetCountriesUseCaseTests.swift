//
//  GetCountriesUseCaseTests.swift
//  CountriesAppTests
//
//  Created by Larissa Magalhaes on 2025-02-17.
//

import XCTest
@testable import CountriesApp

final class GetCountriesUseCaseTests: XCTestCase {

	/// Given a list of unsorted countries and a use case with a mock repository
	/// When executing the use case
	/// Then the result should be sorted alphabetically by country name
	func testSorted() async throws {
		
		let countryZ = try! self.createCountry(name: "Z Country", flag: "Z Flag")
		let countryG = try! self.createCountry(name: "G Country", flag: "G Flag")
		let countryA = try! self.createCountry(name: "A Country", flag: "A Flag")
		let countryM = try! self.createCountry(name: "M Country", flag: "M Flag")
		let countryB = try! self.createCountry(name: "B Country", flag: "B Flag")
		
		let countries = [countryZ, countryG, countryA, countryM, countryB]
		let mock = MockCountryRepository(countries: countries)
		let useCase = GetCountriesUseCase(repository: mock)
		
		Task {
			try? await Task.sleep(nanoseconds: 1_000_000)
		}
		
		let result = try await useCase.execute()
		
		let expectedResult = countries
			.map { CountrySimple(name: $0.name, flag: $0.flagURL) }
			.sorted(by: { $0.name < $1.name })
		
		XCTAssertEqual(result, expectedResult)
	}
	
	private func createCountry(name: String, flag: String) throws -> Country {
		let jsonData = """
	 {
	  "name": { "common": "\(name)" },
	  "flags": { "png": "\(flag)" }
	 }
	 """.data(using: .utf8)!
		
		return try JSONDecoder().decode(Country.self, from: jsonData)
	}
}
