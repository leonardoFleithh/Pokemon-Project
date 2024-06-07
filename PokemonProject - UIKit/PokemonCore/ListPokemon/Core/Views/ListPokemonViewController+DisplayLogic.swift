//
//  ListPokemonViewController+DisplayLogic.swift
//  PokemonProject - UIKit
//
//  Created by Leonardo Campanher on 24/05/24.
//

import Foundation

protocol ListPokemonViewControllerLogic {
    func presentPokemonListSuccess(_ viewModel: ListPokemonViewModel.GetPokemons.ViewModel.Success)
    func presentPokemonListFailure(_ viewModel: ListPokemonViewModel.GetPokemons.ViewModel.Failure)
}

extension ListPokemonViewController: ListPokemonViewControllerLogic {
    func presentPokemonListSuccess(_ viewModel: ListPokemonViewModel.GetPokemons.ViewModel.Success) {
        pokemonListViewModel = viewModel
        DispatchQueue.main.async {
            self.tableview.reloadData()
        }
    }
    
    func presentPokemonListFailure(_ viewModel: ListPokemonViewModel.GetPokemons.ViewModel.Failure) {
        
    }
}
