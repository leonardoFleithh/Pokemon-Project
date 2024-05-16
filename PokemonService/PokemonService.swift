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
                                  type: T.Type,
                                  completion: @escaping (Result<T, Error>) -> Void) {
        
        guard let url = request.url else {
            completion(.failure(PokemonError.badURL))
            return
        }
        
        var request = URLRequest(url: url)
        request.httpMethod = request.httpMethod
        
        let task = URLSession.shared.dataTask(with: request) { data, _, error in
            guard let data = data, error == nil else {
                completion(.failure(PokemonError.badServerResponse))
                return
            }
            
            do {
                let result = try JSONDecoder().decode(type.self, from: data)
                print(String(describing: result))
            } catch {
                completion(.failure(PokemonError.cannotLoadFromNetwork))
            }
        }
        task.resume()
        
    }
}
