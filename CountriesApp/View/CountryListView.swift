//
//  CountryListView.swift
//  CountriesApp
//
//  Created by Larissa Magalhaes on 2025-02-14.
//

import SwiftUI

struct CountryListView: View {
	
	@ObservedObject var viewModel: CountryListViewModel
	
	var body: some View {
		NavigationStack {
			List {
				ForEach($viewModel.countryItemViewModel, id: \.name) { $item in
					CountryItemView(viewModel: item)
						.onTapGesture {
							self.viewModel.showCountry(item.name)
						}
				}
			}
			.sheet(isPresented: self.$viewModel.showSheet) {
				self.viewModel.dismissDetails()
			} content: {
				if let selectedCountryViewModel = viewModel.selectedCountryViewModel {
					CountryDetailsView(viewModel: selectedCountryViewModel)
						.presentationDetents([.medium])
				}
			}
			.navigationTitle("Countries")
			.onAppear() {
				self.viewModel.bind()
			}
		}
	}
}

#Preview {
	CountryListView(viewModel: .init(getCountriesUseCase: GetCountriesRepository()))
}
