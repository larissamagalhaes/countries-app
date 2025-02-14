//
//  ErrorView.swift
//  CountriesApp
//
//  Created by Larissa Magalhaes on 2025-02-14.
//

import SwiftUI

struct ErrorView: View {
    var body: some View {
		VStack(spacing: 16) {
			Image("error-message")
			Text("An error occurred while processing your request. Please try again later.")
				.frame(maxWidth: 200)
				.font(.headline)
			
		}
    }
}

#Preview {
    ErrorView()
}
