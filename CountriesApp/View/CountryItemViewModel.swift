//
//  CountryItemViewModel.swift
//  CountriesApp
//
//  Created by Larissa Magalhaes on 2025-02-14.
//

import Foundation

class CountryItemViewModel {
	@Published var name = ""
	@Published var flag = ""
	
	init(name: String, flag: String) {
		self.name = name
		self.flag = flag
	}
}
