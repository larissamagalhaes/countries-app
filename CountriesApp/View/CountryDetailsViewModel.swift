//
//  CountryDetailsViewModel.swift
//  CountriesApp
//
//  Created by Larissa Magalhaes on 2025-02-14.
//

import Foundation

class CountryDetailsViewModel: ObservableObject {

	@Published var name = ""
	@Published var flag = ""
	@Published var capital = "-"
	@Published var continent = "-"
	@Published var population = "-"
	@Published var showErrorView = false
	
	private let getCountryUseCase: GetCountryUseCaseProtocol
	
	init(getCountryUseCase: GetCountryUseCaseProtocol) {
		self.getCountryUseCase = getCountryUseCase
	}
	
	@MainActor
	func bind() {
		Task {
			do {
				let result = try await self.getCountryUseCase.execute()
				self.name = result.name.isEmpty ? "Unknown" : result.name
				self.capital = result.capital.isEmpty ? "Unknown" : result.capital
				self.flag = result.flag.isEmpty ? "Unknown" : result.flag
				self.continent = result.continent.isEmpty ? "Unknown" : result.continent
				self.population = result.population.isEmpty ? "Unknown" : result.population
				self.showErrorView = false
			} catch {
				self.showErrorView = true
			}
			
		}
	}
}
