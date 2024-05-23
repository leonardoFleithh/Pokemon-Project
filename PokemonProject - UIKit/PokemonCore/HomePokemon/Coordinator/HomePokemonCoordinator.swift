//
//  HomePokemonCoordinator.swift
//  PokemonProject - UIKit
//
//  Created by Leonardo Campanher on 22/05/24.
//

import Foundation
import UIKit

final class HomePokemonCoordinator: Coordinator {
    var navigationController: UINavigationController
    
    init(navigationController: UINavigationController) {
        self.navigationController = navigationController
    }
    
    func start() {
        setupBackImage()
        
        let homePokeVC = HomePokemonEntryPoint.make(self)
        navigationController.pushViewController(homePokeVC, animated: true)
    }
}
