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
	@Published var capital = ""
	@Published var continent = ""
	@Published var population = ""
	
	private let getCountryUseCase: GetCountryUseCaseProtocol
	
	init(getCountryUseCase: GetCountryUseCaseProtocol) {
		self.getCountryUseCase = getCountryUseCase
	}
	
	@MainActor
	func bind() {
		Task {
			do {
				let result = try await self.getCountryUseCase.execute()
				self.name = result.name
				self.capital = result.capital
				self.flag = result.flag
				self.continent = result.continent
				self.population = result.population
			} catch {
				print("😱 Error: \(error)")
			}
			
		}
	}
}
