//
//  PokemonSprites.swift
//  PokemonProject - UIKit
//
//  Created by Leonardo Campanher on 28/05/24.
//

import Foundation

struct PokemonSelected: Codable {
    var sprites: [PokemonSprites]
    var weight: Int
}

struct PokemonSprites: Codable {
    var front_default: String?
}
