//
//  PokemonRequest.swift
//  PokemonProject - UIKit
//
//  Created by Leonardo on 08/05/24.
//

import Foundation

final class PokemonRequest {
    private var endpoint: PokemonEndpoint
    private var path: [String]
    private var queryItems: [URLQueryItem]
    
    private var urlString: String {
        var string = endpoint.baseURL
        
        if !path.isEmpty {
            path.forEach {
                string += $0
            }
        }
        
        
        if !queryItems.isEmpty {
            string += "?"
    
            let arguments = queryItems.compactMap {
                guard let value = $0.value else { return nil }
                
                return "\($0.name)=\(value)"
            }.joined(separator: "?")
            
            string += arguments
        }
        return string
    }
    
    public var url: URL? {
        return URL(string: urlString)
    }
    
    public var httpMethod = "GET"
    
    init(endpoint: PokemonEndpoint, path: [String] = [], queryItems: [URLQueryItem] = []) {
        self.endpoint = endpoint
        self.path = path
        self.queryItems = queryItems
    }
}
