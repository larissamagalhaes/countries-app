//
//  CountryListViewModel.swift
//  CountriesApp
//
//  Created by Larissa Magalhaes on 2025-02-14.
//

import Foundation

class CountryListViewModel: ObservableObject {
	
	@Published var showCountryDetail: [CountryItemViewModel] = []
	@Published var showSheet = false
	var selectedCountryViewModel: CountryDetailsViewModel?
	@Published var currentState: State = .loading
	
	private let getCountriesUseCase: GetCountriesUseCaseProtocol
	
	init(getCountriesUseCase: GetCountriesUseCaseProtocol) {
		self.getCountriesUseCase = getCountriesUseCase
	}
	
	@MainActor
	func bind() {
		Task {
			do {
				try await self.showCountryDetail = self.getCountriesUseCase.execute()
					.map { CountryItemViewModel(name: $0.name, flag: $0.flag) }
				self.currentState = .loaded
			} catch {
				self.currentState = .error
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

extension CountryListViewModel {
	
	enum State {
		case loading
		case loaded
		case error
	}
}
