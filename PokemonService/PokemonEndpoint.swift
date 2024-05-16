//
//  PokemonEndpoint.swift
//  PokemonProject - UIKit
//
//  Created by Leonardo on 08/05/24.
//

import Foundation

enum PokemonEndpoint: String {
    case pokemon
    case berries
    
    public var baseURL: String {
        var baseURL: String = "https://pokeapi.co/api/v2/"
        
        switch self {
        case .pokemon:
            baseURL += "pokemon"
        case .berries:
            baseURL += "berry"
        }
        
        return baseURL
    }
}

// all pokemons: pokemon/?offset=0&limit=151
