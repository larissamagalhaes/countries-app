//
//  CountryListView.swift
//  CountriesApp
//
//  Created by Larissa Magalhaes on 2025-02-14.
//

import SwiftUI

struct CountryListView: View {
	var body: some View {
		NavigationStack {
			List {
				CountryItemView(viewModel: .init(name: "Test", flag: "https://flagcdn.com/w320/gs.png"))
				CountryItemView(viewModel: .init(name: "Test", flag: "https://flagcdn.com/w320/gs.png"))
				CountryItemView(viewModel: .init(name: "Test", flag: "https://flagcdn.com/w320/gs.png"))
				CountryItemView(viewModel: .init(name: "Test", flag: "https://flagcdn.com/w320/gs.png"))
			}
			.navigationTitle("Menu")
		}
	}
}

#Preview {
	CountryListView()
}
