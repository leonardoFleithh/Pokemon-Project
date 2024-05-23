//
//  ChoosePokemonEntryPoint.swift
//  PokemonProject - UIKit
//
//  Created by Leonardo Campanher on 21/05/24.
//

import Foundation
import UIKit

enum ChoosePokemonEntryPoint {
    
    public struct Parameters {
        let imageHome: String?
    }
    
    static func configureView(_ coordinator: (Coordinator & ChoosePokemonCoordinatable)?, parameters: Parameters? = nil) -> ChoosePokemonViewController {
        
        let imageBackground = ""
        let presenter = ChoosePokemonPresenter()
        let interactor = ChoosePokemonInteractor(presenter: presenter, imageBackground: imageBackground)
        let viewController = ChoosePokemonViewController(interactor: interactor, coordinator: coordinator)
        
        presenter.viewController = viewController
        
        //MAR: Data Store
        interactor.imageBackground = parameters?.imageHome
        
        return viewController
    }
}

