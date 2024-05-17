//
//  Pokemon.swift
//  PokemonProject - UIKit
//
//  Created by Leonardo Campanher on 15/05/24.
//

import Foundation

struct Pokemon: Codable {
    let results: [PokemonResult]
}

struct PokemonResult: Codable {
    let name: String
    let url: String
}

