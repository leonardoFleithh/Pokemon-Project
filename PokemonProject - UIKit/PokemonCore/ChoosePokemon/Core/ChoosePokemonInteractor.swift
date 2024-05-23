//
//  ChoosePokemonInteractor.swift
//  PokemonProject - UIKit
//
//  Created by Leonardo Campanher on 20/05/24.
//

import Foundation
import UIKit

protocol ChoosePokemonInteractorLogic {
    func setTypePokemon(response: ChoosePokemonViewModel.Request)
}

protocol ChoosePokemonInteractorDataStore {
    var imageBackground: String? { get }
}

final class ChoosePokemonInteractor: ChoosePokemonInteractorLogic, ChoosePokemonInteractorDataStore {
    
    //MARK: Var's
    let presenter: ChoosePokemonPresenter
    var imageBackground: String?
    
    init(presenter: ChoosePokemonPresenter, imageBackground: String?) {
        self.presenter = presenter
        self.imageBackground = imageBackground
    }
    
    func setTypePokemon(response: ChoosePokemonViewModel.Request) {
        let response = ChoosePokemonViewModel.Response(image: response.image)
        presenter.presenterPokemonTypeSuccess(response: response)
    }
}
