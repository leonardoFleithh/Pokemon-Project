//
//  ListPokemonCoordinator.swift
//  PokemonProject - UIKit
//
//  Created by Leonardo Campanher on 24/05/24.
//

import Foundation
import UIKit

final class ListPokemonCoordinator: Coordinator {
    var navigationController: UINavigationController
    
    init(navigationController: UINavigationController) {
        self.navigationController = navigationController
    }
    
    func start() {
        let listPokemonVc = ListPokemonEntryPoint.make(self)
        self.navigationController.pushViewController(listPokemonVc, animated: true)
        
    }
}
