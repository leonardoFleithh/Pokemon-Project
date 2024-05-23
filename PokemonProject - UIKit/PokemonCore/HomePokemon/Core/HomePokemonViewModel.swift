//
//  HomePokemonViewModel.swift
//  PokemonProject - UIKit
//
//  Created by Leonardo Campanher on 22/05/24.
//

import Foundation

struct HomePokemonStrings {
    var numberTitle: String
    var numberDescription: String
    var typeTitle: String
    var typeDescription: String
    var centerTitle: String
    var centerDescription: String
}

enum HomePokemonViewModel {
    enum GetData {
        struct Request {}
        enum Response {
            struct Success {
                let pokemon: Pokemon
            }
            
            struct Failure {
                let error: PokemonError
            }
        }
        enum ViewModel {
            struct Success {
                let name: String
                let url: String
            }
            
            struct Failure {
                let error: PokemonError
            }
        }
    }
    
    enum DisplayBackground {
        struct Request {}
        enum Response {
            struct Success {
                let image: String
                var text: HomePokemonStrings
            }
            struct Failure {
                let error: PokemonError
            }
        }
        
        enum ViewModel {
            struct Success {
                let image: String
                let text: HomePokemonStrings
            }
            struct Failure {
                let error: PokemonError
            }
        }
    }
}
