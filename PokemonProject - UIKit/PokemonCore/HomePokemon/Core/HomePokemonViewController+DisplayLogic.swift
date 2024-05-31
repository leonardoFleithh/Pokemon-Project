//
//  HomePokemonViewController+DisplayLogic.swift
//  PokemonProject - UIKit
//
//  Created by Leonardo on 08/05/24.
//

import Foundation
import UIKit

protocol HomePokemonViewControllerDisplayLogic {
    func presentPokemonBackground(_ viewModel: HomePokemonViewModel.DisplayBackground.ViewModel.Success)
    func presentPokemonBackground(_ viewModel: HomePokemonViewModel.DisplayBackground.ViewModel.Failure)
    
    func showPokemonList(_ viewModel: HomePokemonViewModel.ShowPokemonList.ViewModel)
}

extension HomePokemonViewController: HomePokemonViewControllerDisplayLogic {
    
    func presentPokemonBackground(_ viewModel: HomePokemonViewModel.DisplayBackground.ViewModel.Success) {
        self.headerView.configureBackgroundImage(image: viewModel.image)
        self.headerView.configureTextsHomeView(numberTitle: viewModel.text.numberTitle,
                                               numberDecription: viewModel.text.numberDescription,
                                               typeTitle: viewModel.text.typeTitle,
                                               typeDescription: viewModel.text.typeDescription,
                                               centerTitle: viewModel.text.centerTitle,
                                               centerDescription: viewModel.text.centerDescription)
    }
    
    func presentPokemonBackground(_ viewModel: HomePokemonViewModel.DisplayBackground.ViewModel.Failure) {
        
    }
    
    func showPokemonList(_ viewModel: HomePokemonViewModel.ShowPokemonList.ViewModel) {
        coordinator?.showPokemonList()
    }
}
