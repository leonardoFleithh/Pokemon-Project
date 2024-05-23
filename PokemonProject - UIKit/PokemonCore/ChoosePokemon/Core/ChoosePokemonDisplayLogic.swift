//
//  ChoosePokemonDisplayLogic.swift
//  PokemonProject - UIKit
//
//  Created by Leonardo Campanher on 20/05/24.
//

import Foundation
import UIKit

protocol ChoosePokemonViewControllerDisplayLogic: AnyObject {
    func setHomePokemonTypeSuccess(viewModel: ChoosePokemonViewModel.ViewModel.Success)
    func setHomePokemonTypeFailure(viewModel: ChoosePokemonViewModel.ViewModel.Failure)
}

extension ChoosePokemonViewController: ChoosePokemonViewControllerDisplayLogic {
    
    func setHomePokemonTypeSuccess(viewModel: ChoosePokemonViewModel.ViewModel.Success) {
        let imageBackground = viewModel.image
        coordinator?.showHomePokemon(imageBackground: imageBackground)
    }
    
    func setHomePokemonTypeFailure(viewModel: ChoosePokemonViewModel.ViewModel.Failure) {
        //criar tela de erro
    }
}
