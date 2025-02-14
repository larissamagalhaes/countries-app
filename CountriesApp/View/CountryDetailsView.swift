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
		VStack(alignment: .leading) {
			Text(self.viewModel.name)
				.font(.title2)
			AsyncImage(url: URL(string: self.viewModel.flag)) { image in
				image.resizable()
			} placeholder: {
				ProgressView()
			}
			.frame(width: 350, height: 175)
			.clipShape(.rect(cornerRadius: 5))
			.aspectRatio(contentMode: .fill)
			
			self.createItem(title: "Capital:",
							body: self.viewModel.capital)
			self.createItem(title: "Continent:",
							body: self.viewModel.continent)
			self.createItem(title: "Population:",
							body: self.viewModel.population)
		}
		.padding(.all, 16)
		.onAppear() {
			self.viewModel.bind()
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
