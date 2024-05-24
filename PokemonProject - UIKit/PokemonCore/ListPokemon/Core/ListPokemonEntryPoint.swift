//
//  ListPokemonEntryPoint.swift
//  PokemonProject - UIKit
//
//  Created by Leonardo Campanher on 24/05/24.
//

import Foundation

public enum ListPokemonEntryPoint {
    
    static func make(_ coordinator: (ListPokemonCoordinator & ListPokemonCoordinatable)?) -> ListPokemonViewController {
        let presenter = ListPokemonPresenter()
        let service = PokemonService()
        let interactor = ListPokemonInteractor(service: service, presenter: presenter)
        let viewController = ListPokemonViewController(interactor: interactor, coordinator: coordinator)
        
        presenter.viewController = viewController
        
        return viewController
    }
}
