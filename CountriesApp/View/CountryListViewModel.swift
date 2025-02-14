//
//  CountryListViewModel.swift
//  CountriesApp
//
//  Created by Larissa Magalhaes on 2025-02-14.
//

import Foundation

class CountryListViewModel: ObservableObject {
	
	@Published var countryItemViewModel: [CountryItemViewModel] = []
	@Published var showSheet = false
	var selectedCountryViewModel: CountryDetailsViewModel?
	
	private let getCountriesUseCase: GetCountriesUseCaseProtocol
	
	init(getCountriesUseCase: GetCountriesUseCaseProtocol) {
		self.getCountriesUseCase = getCountriesUseCase
	}
	
	@MainActor
	func bind() {
		Task {
			do {
				try await self.countryItemViewModel = self.getCountriesUseCase.execute()
					.map { CountryItemViewModel(name: $0.name, flag: $0.flag) }
			} catch {
				print("😱 Error: \(error)")
			}
			
		}
	}
	
	func showCountry(_ name: String) {
		self.showSheet = true
		let getCountryUseCase = GetCountryUseCase(name: name)
		self.selectedCountryViewModel = CountryDetailsViewModel(getCountryUseCase: getCountryUseCase)
	}
	
	func dismissDetails() {
		self.showSheet = false
	}
}
