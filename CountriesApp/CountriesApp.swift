//
//  CountriesApp.swift
//  CountriesApp
//
//  Created by Larissa Magalhaes on 2025-02-14.
//

import SwiftUI

@main
struct CountriesApp: App {
    var body: some Scene {
        WindowGroup {
			CountryListView(viewModel: .init(getCountriesUseCase: GetCountriesUseCase()))
        }
    }
}
