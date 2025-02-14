//
//  FlagImageView.swift
//  CountriesApp
//
//  Created by Larissa Magalhaes on 2025-02-14.
//

import SwiftUI

struct FlagImageView: View {
	
	let url: String
	let width: CGFloat
	let height: CGFloat
	
    var body: some View {
		AsyncImage(url: URL(string: self.url)) { phase in
			
			if let image = phase.image {
				image
					.resizable()
					.aspectRatio(contentMode: .fill)
					.frame(width: self.width, height: self.height)
					.clipShape(RoundedRectangle(cornerRadius: 5))
			} else if phase.error != nil {
				Image("image-error")
					.frame(width: self.height, height: self.height)
					.clipShape(RoundedRectangle(cornerRadius: 5))
			} else {
				ProgressView()
			}
		}
		.overlay(
			RoundedRectangle(cornerRadius: 5)
				.strokeBorder(FillShapeStyle(), lineWidth: 1)
		)
    }
}

#Preview {
	FlagImageView(url: "https://flagcdn.com/w320/at.png", width: 300, height: 175)
}
