//
//  HomePokemonPresenter.swift
//  PokemonProject - UIKit
//
//  Created by Leonardo on 08/05/24.
//

import Foundation
import UIKit

protocol HomePokemonPresenterLogic {
    func presentPokemonCharacteristics(_ response: HomePokemonViewModel.GetData.Response.Success)
    func presentPokemonCharacteristics(_ response: HomePokemonViewModel.GetData.Response.Failure)

    func displayHomeBackground(_ response: HomePokemonViewModel.DisplayBackground.Response.Success)
    func displayHomeBackground(_ response: HomePokemonViewModel.DisplayBackground.Response.Failure)
}

final class HomePokemonPresenter: HomePokemonPresenterLogic {
    
    weak var viewController: HomePokemonViewController?
    
    func presentPokemonCharacteristics(_ response: HomePokemonViewModel.GetData.Response.Success) {
        
    }
    
    func presentPokemonCharacteristics(_ response: HomePokemonViewModel.GetData.Response.Failure) {
        
    }
    
    func displayHomeBackground(_ response: HomePokemonViewModel.DisplayBackground.Response.Success) {
        let pokemonViewBackground = HomePokemonViewModel.DisplayBackground.ViewModel.Success(image: response.image, text: response.text)
        viewController?.presentPokemonBackground(pokemonViewBackground)
    }
    
    func displayHomeBackground(_ response: HomePokemonViewModel.DisplayBackground.Response.Failure) {
        
    }
}
