//
//  ListPokemonInteractor.swift
//  PokemonProject - UIKit
//
//  Created by Leonardo Campanher on 23/05/24.
//

import Foundation

protocol ListPokemonInteractorLogic {
    func fetchImagesForPokemon(_ request: ListPokemonViewModel.GetPokemons.Request)
}

protocol ListPokemonInteractorDataStore {
    
}

final class ListPokemonInteractor: ListPokemonInteractorLogic {
    
    //MARK: Var's
    let service: PokemonService
    let presenter: ListPokemonPresenter
    
    var pokemonNamesList: [String]?
    var pokemonsURLsList: [String]?
    
    init(service: PokemonService, presenter: ListPokemonPresenter) {
        self.service = service
        self.presenter = presenter
    }
    
    //MARK: Func's
    
    func fetchImagesForPokemon(_ request: ListPokemonViewModel.GetPokemons.Request) {
        guard let pokemonInfo = getSprite(), !pokemonInfo.images.isEmpty else {
            return
        }
        
        for pokemonImage in pokemonsURLsList {
            service.fetchPokemon(request: .init(urlPokemonSelected: pokemonImage, endpoint: nil), type: PokemonSprites.self) { result in
                switch result {
                case .success(let pokemon):
                    pokemonImagesList.append(pokemon.front_default ?? "placeholder")
                    
                    let response = ListPokemonViewModel.GetPokemons.Response.Success(images: pokemonImagesList, names: self.pokemonNamesList ?? ["no name"])
                    
                    self.presenter.displayPokemonSuccess(response)
                    
                case .failure(let error):
                    print(String(describing: error))
                    let error = ListPokemonViewModel.GetPokemons.Response.Failure(error: error)
                    self.presenter.displayPokemonFailure(error)
                }
            }
        }

    }
    
    private func getSprite() -> ListPokemonViewModel.GetPokemons.Response.Success? {
        var urlsList: [String] = []
        var namesList: [String] = []
        var response: ListPokemonViewModel.GetPokemons.Response.Success?
        
        self.service.fetchPokemon(request: PokemonRequest.init(urlPokemonSelected: nil, endpoint: .pokemon, path: ["?offset=0&limit=151"] ), type: Pokemon.self) { result in
            switch result {
            case .success(let pokemon):
                pokemon.results.forEach { pokemon in
                    print(String(describing: pokemon))
                    urlsList.append(pokemon.url)
                    namesList.append(pokemon.name)
                    response = ListPokemonViewModel.GetPokemons.Response.Success.init(images: urlsList, names: namesList)
                }
            case .failure(let error):
                print(String(describing: error))
            }
        }
        
        return response ?? nil
    }
}
