//
//  CountryListViewModel.swift
//  CountriesApp
//
//  Created by Larissa Magalhaes on 2025-02-14.
//

import Foundation

class CountryListViewModel: ObservableObject {
	
	@Published var countryItemViewModel: [CountryItemViewModel] = []
	
	private let getCountriesUseCase: GetCountriesUseCaseProtocol
	
	init(getCountriesUseCase: GetCountriesUseCaseProtocol) {
		self.getCountriesUseCase = getCountriesUseCase
	}
	
	func bind() {
				Task {
			do {
				try await self.countryItemViewModel = self.getCountriesUseCase.execute()
					.map { CountryItemViewModel(name: $0.name, flag: $0.flagURL) }
			} catch {
				print("😱 Error: \(error)")
			}
			
		}
	}
}
