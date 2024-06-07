//
//  PokemonService.swift
//  PokemonProject - UIKit
//
//  Created by Leonardo on 08/05/24.
//

import Foundation

enum PokemonError: Error {
    case badURL
    case badServerResponse
    case cannotLoadFromNetwork
}

final class PokemonService {
    
    static let shared = PokemonService()
    
    public init() {}
    
    public func fetchPokemon<T: Codable>(request: PokemonRequest,
                                         type: T.Type) async throws -> T {
        
        guard let url = request.url else {
            throw PokemonError.badURL
        }
        
        var request = URLRequest(url: url)
        request.httpMethod = request.httpMethod
        
        let (data, response) = try await URLSession.shared.data(for: request)
        
        guard let response = response as? HTTPURLResponse, response.statusCode == 200 else {
            throw PokemonError.badServerResponse
        }
        
        do {
            let decode = JSONDecoder()
            decode.keyDecodingStrategy = .convertFromSnakeCase
            let result = try decode.decode(type, from: data)
            return result
        } catch {
            throw PokemonError.cannotLoadFromNetwork
        }
    }
}

