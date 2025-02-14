//
//  CountryItemView.swift
//  CountriesApp
//
//  Created by Larissa Magalhaes on 2025-02-14.
//

import SwiftUI

struct CountryItemView: View {
	
	let viewModel: CountryItemViewModel
	
    var body: some View {
		HStack(spacing: 8) {
			AsyncImage(url: URL(string: self.viewModel.flag)) { image in
				image.resizable()
			} placeholder: {
				ProgressView()
			}
			.frame(width: 100, height: 50)
			.clipShape(.rect(cornerRadius: 5))
			Text(self.viewModel.name)
		}
    }
}

#Preview {
	CountryItemView(viewModel: .init(name: "Testing", flag: "https://flagcdn.com/w320/gs.png"))
}
