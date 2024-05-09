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
        switch self {
        case .pokemon:
            return "pokemon"
        case .berries:
            return "berries"
        }
    }
}
