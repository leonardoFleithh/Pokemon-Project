//
//  HomePokemonCoordinatable.swift
//  PokemonProject - UIKit
//
//  Created by Leonardo Campanher on 22/05/24.
//

import Foundation

protocol HomePokemonCoordinatable {
    func showPokemonList()
}

extension HomePokemonCoordinator: HomePokemonCoordinatable {
    func showPokemonList() {
        let coordinator = ListPokemonCoordinator(navigationController: navigationController)
        let listPokemonVc = ListPokemonEntryPoint.make(coordinator)
        navigationController.pushViewController(listPokemonVc, animated: true)
        
    }
}
