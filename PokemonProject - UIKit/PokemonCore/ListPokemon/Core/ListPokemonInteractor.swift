//
//  ListPokemonInteractor.swift
//  PokemonProject - UIKit
//
//  Created by Leonardo Campanher on 23/05/24.
//

import Foundation

protocol ListPokemonInteractorLogic {
    func fetchImagesForPokemon(_ request: ListPokemonViewModel.GetPokemons.Request) async throws
}

protocol ListPokemonInteractorDataStore {
    
}

final class ListPokemonInteractor: ListPokemonInteractorLogic {
    
    //MARK: Var's
    let service: PokemonService
    let presenter: ListPokemonPresenter
    
    var pokemonNamesList: [String] = []
    var pokemonsURLsList: [String] = []
    
    init(service: PokemonService, presenter: ListPokemonPresenter) {
        self.service = service
        self.presenter = presenter
    }
    
    //MARK: Func's
    
    func fetchImagesForPokemon(_ request: ListPokemonViewModel.GetPokemons.Request) async throws  {
        
        let pokemonSprites = try await getSprite()
        
        guard let pokemonInfo = pokemonSprites, !pokemonInfo.images.isEmpty else {
            return
        }
        
        guard pokemonInfo.images.count == pokemonInfo.names.count else {
            return
        }
        
        for pokemonImage in pokemonInfo.images {
            
            let response = try await self.service.fetchPokemon(request: .init(urlPokemonSelected: pokemonImage, endpoint: .none), type: PokemonSelected.self)
            
            for image in response.sprites {
                self.pokemonsURLsList.append(image.front_default ?? "no image")
            }
        }
        
        self.presenter.displayPokemonSuccess(.init(images: pokemonsURLsList, names: pokemonInfo.names))
    }
    
    
    private func getSprite() async throws -> ListPokemonViewModel.GetPokemons.Response.Success? {
        var urlsList: [String] = []
        var namesList: [String] = []
        
        do {
            let response = try await self.service.fetchPokemon(request: .init(urlPokemonSelected: nil, endpoint: .pokemon, path: ["/?offset=0&limit=151"]), type: Pokemon.self)
            
            for pokeInfo in response.results {
                urlsList.append(pokeInfo.url)
                namesList.append(pokeInfo.name)
            }
            
            return ListPokemonViewModel.GetPokemons.Response.Success.init(images: urlsList, names: namesList)
        } catch {
            throw PokemonError.cannotLoadFromNetwork
        }
    }
}
