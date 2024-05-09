//
//  PokemonRequest.swift
//  PokemonProject - UIKit
//
//  Created by Leonardo on 08/05/24.
//

import Foundation

struct PokemonRequest {
    private let endpoint: PokemonEndpoint
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
            
            queryItems.forEach {
                let value = $0.value
                string += "\($0.name)=\(value)"
            }
            
        }
        
        return string
    }
    
    public var url: URL? {
        let url = URL(string: urlString)
        return url
    }
    
    public var httpMethod = "GET"
    
    init(endpoint: PokemonEndpoint, path: [String] = [], queryItems: [URLQueryItem] = []) {
        self.endpoint = endpoint
        self.path = path
        self.queryItems = queryItems
    }
}
