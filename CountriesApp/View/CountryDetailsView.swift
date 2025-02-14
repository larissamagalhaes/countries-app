//
//  CountryDetailsView.swift
//  CountriesApp
//
//  Created by Larissa Magalhaes on 2025-02-14.
//

import SwiftUI

struct CountryDetailsView: View {
	
	@ObservedObject var viewModel: CountryDetailsViewModel

	var body: some View {
		self.setupView()
			.padding(.all, 16)
			.onAppear() {
				self.viewModel.bind()
			}
	}
	
	@ViewBuilder
	private func setupView() -> some View {
		if self.viewModel.showErrorView {
			ErrorView()
		} else {
			VStack(alignment: .leading) {
				Text(self.viewModel.name)
					.font(.title2)
				FlagImageView(url: self.viewModel.flag, width: 300, height: 175)
				
				self.createItem(title: "Capital:",
								body: self.viewModel.capital)
				self.createItem(title: "Continent:",
								body: self.viewModel.continent)
				self.createItem(title: "Population:",
								body: self.viewModel.population)
			}
		}
	}
	
	private func createItem(title: String, body: String) -> some View {
		HStack(spacing: 4) {
			Text(title)
				.font(.headline)
			Text(body)
		}
	}
}

#Preview {
	CountryDetailsView(viewModel: .init(getCountryUseCase: GetCountryUseCase(name: "Test", repository: CountryRepository())))
}
