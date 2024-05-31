//
//  ListPokemonPresenter.swift
//  PokemonProject - UIKit
//
//  Created by Leonardo Campanher on 24/05/24.
//

import Foundation

protocol ListPokemonPresenterLogic {
    func displayPokemonSuccess(_ response: ListPokemonViewModel.GetPokemons.Response.Success)
    func displayPokemonFailure(_ response: ListPokemonViewModel.GetPokemons.Response.Failure)
}

final class ListPokemonPresenter: ListPokemonPresenterLogic {
    //MARK: Var's
    weak var viewController: ListPokemonViewController?
    
    //MARK: Func's
    func displayPokemonSuccess(_ response: ListPokemonViewModel.GetPokemons.Response.Success) {
        let viewModel = ListPokemonViewModel.GetPokemons.ViewModel.Success(images: response.images, names: response.names)
        
        viewController?.presentPokemonListSuccess(viewModel)
    }
    
    func displayPokemonFailure(_ response: ListPokemonViewModel.GetPokemons.Response.Failure) {
        //tratativa de erro
    }
}
