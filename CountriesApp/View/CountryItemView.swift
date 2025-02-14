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
			FlagImageView(url: self.viewModel.flag, width: 100, height: 50)
			Text(self.viewModel.name)
		}
		.frame(maxWidth: .infinity, maxHeight: .infinity, alignment: .leading)
    }
}

#Preview {
	CountryItemView(viewModel: .init(name: "Testing", flag: "https://flagcdn.com/w320/gs.png"))
}
