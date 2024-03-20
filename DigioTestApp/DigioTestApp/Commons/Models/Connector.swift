//
//  Connector.swift
//  DigioTestApp
//
//  Created by Caio César Carneiro Zerbini on 20/03/24.
//

import Foundation

protocol Connector {
    func fetchMainData() async throws -> MainViewResponse
}

enum NetworkError: Error {
    case invalidURL
    case serverFail
}

final class DefaultConnector: Connector {
    
    private let hostURL: String = "https://7hgi9vtkdc.execute-api.sa-east-1.amazonaws.com/sandbox"
    
    func fetchMainData() async throws -> MainViewResponse {
        guard let url = URL(string: hostURL + "/products") else {
            throw NetworkError.invalidURL
        }
        let request = URLRequest(url: url)
        let (data, _) = try await URLSession.shared.data(for: request)
        let mainResponse = try JSONDecoder().decode(MainViewResponse.self, from: data)
        return mainResponse
    }
    
}
