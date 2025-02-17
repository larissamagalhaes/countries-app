//
//  NetworkManager.swift
//  CountriesApp
//
//  Created by Larissa Magalhaes on 2025-02-14.
//

import Foundation

/// Sends an asynchronous network request and decodes the response into a specified model.
class NetworkManager {
	
	func request<T:Decodable>(model: T.Type,
							  endpoint: Endpoint) async throws -> T {
		let (data, _) = try await URLSession.shared.data(for: URLRequest(url: endpoint.url))
		
		return try JSONDecoder().decode(model.self, from: data)
	}
}

enum APIError: Error {
	case invalidEndpoint
	case decodeFailure
	case userNotFound
}
