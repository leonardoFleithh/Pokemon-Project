//
//  ListPokemonViewModel.swift
//  PokemonProject - UIKit
//
//  Created by Leonardo Campanher on 24/05/24.
//

import Foundation

struct ListPokemonViewModel {
    enum GetPokemons {
        struct Request {}
        enum Response {
            struct Success {
                let images: [String]
                let names: [String]
            }
            struct Failure {
                let error: Error
            }
        }
        enum ViewModel {
            struct Success {
                let images: [String]
                let names: [String]
            }
            struct Failure {
                let error: Error
            }
        }
    }
    
    enum GetImagesPokemons {
        struct Request {}
        enum Response {
            struct Success {
                
            }
            struct Failure {
                
            }
        }
        enum ViewModel {
            struct Success {
                
            }
            struct Failure {
                
            }
        }
    }
}
