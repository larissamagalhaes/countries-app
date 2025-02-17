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
			self.setupView()
			.navigationTitle("Countries")
			.onAppear() {
				self.viewModel.bind()
			}
		}
	}
	
	@ViewBuilder
	private func setupView() -> some View {
		switch viewModel.currentState {
		case .loading:
			ProgressView()
		case .loaded:
			List {
				ForEach($viewModel.showCountryDetail, id: \.name) { $item in
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
		case .error:
			ErrorView()
		}
	}
}

#Preview {
	CountryListView(viewModel: .init(getCountriesUseCase: GetCountriesUseCase()))
}
