//
//  ListPokemonInteractor.swift
//  PokemonProject - UIKit
//
//  Created by Leonardo Campanher on 23/05/24.
//

import Foundation

protocol ListPokemonInteractorLogic {
    func fetchAllPokemons(_ request: String)
    func fetchImagesForPokemon(_ request: String)
}

protocol ListPokemonInteractorDataStore {
    
}

final class ListPokemonInteractor: ListPokemonInteractorLogic {
    
    
    //MARK: Var's
    let service: PokemonService
    let presenter: ListPokemonPresenter
    
    init(service: PokemonService, presenter: ListPokemonPresenter) {
        self.service = service
        self.presenter = presenter
    }
    
    //MARK: Func's
    func fetchAllPokemons(_ request: String) {
        
    }
    
    func fetchImagesForPokemon(_ request: String) {
        
    }
}
