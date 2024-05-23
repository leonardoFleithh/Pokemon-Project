//
//  ChoosePokemonPresenter.swift
//  PokemonProject - UIKit
//
//  Created by Leonardo Campanher on 20/05/24.
//

import Foundation
import UIKit

protocol ChoosePokemonPresenterLogic {
    func presenterPokemonTypeSuccess(response: ChoosePokemonViewModel.Response)
}

final class ChoosePokemonPresenter: ChoosePokemonPresenterLogic {
    //MARK: Var's
    weak var viewController: ChoosePokemonViewController?
    
    func presenterPokemonTypeSuccess(response: ChoosePokemonViewModel.Response) {
        var viewModel = ChoosePokemonViewModel.ViewModel.Success(image: "")
        
        switch response.image {
        case "waterType":
            viewModel.image = "waterType"
        case "fireType":
            viewModel.image = "fireType"
        case "thunderType":
            viewModel.image = "thunderType"
        case "ghostType":
            viewModel.image = "ghostType"
        case "leefType":
            viewModel.image = "leefType"
            let viewModel = ChoosePokemonViewModel.ViewModel.Failure(error: PokemonResponseError.imageDontExist)
            viewController?.setHomePokemonTypeFailure(viewModel: viewModel)
        default:
            break
        }
        viewController?.setHomePokemonTypeSuccess(viewModel: viewModel)
    }
}
