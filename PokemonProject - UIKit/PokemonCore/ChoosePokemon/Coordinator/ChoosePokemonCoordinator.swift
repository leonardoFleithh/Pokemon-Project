//
//  ChoosePokemonCoordinator.swift
//  PokemonProject - UIKit
//
//  Created by Leonardo Campanher on 21/05/24.
//

import Foundation
import UIKit

protocol ChoosePokemonCoordinatable {
    func showHomePokemon(imageBackground: String?)
}

final class ChoosePokemonCoordinator: Coordinator, HomePokemonCoordinatable {
    func showPokemonList() {
        
    }
    
    func showChoosePokemonType() {
        
    }
    
    
    var navigationController: UINavigationController
    
    init(navigationController: UINavigationController) {
        self.navigationController = navigationController
    }
    
    func start() {
        setupBackImage()
        
        let choosePokemonVC = ChoosePokemonEntryPoint.configureView(self)
        navigationController.pushViewController(choosePokemonVC, animated: true)
    }
}

extension ChoosePokemonCoordinator: ChoosePokemonCoordinatable {
    func showHomePokemon(imageBackground: String?) {
        let parameters = HomePokemonEntryPoint.Parameters.init(image: imageBackground ?? "")
        let homePokemonVC = HomePokemonEntryPoint.make(self, parametes: parameters)
        navigationController.pushViewController(homePokemonVC, animated: true)
    }
}


