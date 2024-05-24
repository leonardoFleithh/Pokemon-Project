//
//  HomePokemonEntryPoint.swift
//  PokemonProject - UIKit
//
//  Created by Leonardo on 08/05/24.
//

import Foundation
import UIKit

public enum HomePokemonEntryPoint {
    
    public struct Parameters {
        let image: String
    }
    
    static func make(_ coordinator: (Coordinator & HomePokemonCoordinatable)?, parametes: Parameters? = nil) -> HomePokemonViewController {
        
        let presenter = HomePokemonPresenter()
        let interactor = HomePokemonInteractor(presenter: presenter, imageBackground: parametes?.image)
        let viewController = HomePokemonViewController(interactor: interactor, coordinator: coordinator)
        
        presenter.viewController = viewController
        
        return viewController
    }
}
