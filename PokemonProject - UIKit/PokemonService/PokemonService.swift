//
//  PokemonService.swift
//  PokemonProject - UIKit
//
//  Created by Leonardo on 08/05/24.
//

import Foundation

final class PokemonService {
    
    public static let shared = PokemonService()
    
    public init() {}
    
    public func fetchPokemon<T: Codable>(request: PokemonRequest,
                                  type: T.Type,
                                  completion: @escaping (Result<T, Error>) -> Void) {
        
        guard let url = request.url else {
            completion(.failure(URLError.badURL as! Error))
            return
        }
        
        var request = URLRequest(url: url)
        request.httpMethod = request.httpMethod
        
        let task = URLSession.shared.dataTask(with: request) { data, _, error in
            guard let data = data, error == nil else {
                completion(.failure(URLError.badServerResponse as! Error))
                return
            }
            
            do {
                let result = try JSONDecoder().decode(type.self, from: data)
                print(String(describing: result))
            } catch {
                completion(.failure(URLError.cannotLoadFromNetwork as! Error))
            }
        }
        task.resume()
        
    }
}
