//
//  HomePokemonInteractor.swift
//  PokemonProject - UIKit
//
//  Created by Leonardo on 08/05/24.
//

import Foundation
import UIKit

protocol HomePokemonInteractorLogic {
    func setImageBackground(_ request: HomePokemonViewModel.DisplayBackground.Request)
}

final class HomePokemonInteractor: HomePokemonInteractorLogic {
    //MARK: Var's
    let presenter: HomePokemonPresenter
    let imageBackground: String?
    
    init(presenter: HomePokemonPresenter, imageBackground: String?) {
        self.presenter = presenter
        self.imageBackground = imageBackground
    }
    
    //MARK: Func's
    func setImageBackground(_ request: HomePokemonViewModel.DisplayBackground.Request) {
        switch self.imageBackground {
        case .none:
            break
        case .some(let data):
            let responsePokemon = responseBackgroundForType(data)
            
            let response = HomePokemonViewModel.DisplayBackground.Response.Success(image: responsePokemon.image, text: responsePokemon.text)
            
            presenter.displayHomeBackground(response)
        }
    }
    
    private func responseBackgroundForType(_ type: String) -> HomePokemonViewModel.DisplayBackground.Response.Success {
        var imageName = String()
        var text = HomePokemonStrings(numberTitle: "",
                                      numberDescription: "",
                                      typeTitle: "",
                                      typeDescription: "",
                                      centerTitle: "",
                                      centerDescription: ""
        )
        
        switch type {
        case "fireType":
            imageName = "fireBackground"
            text.numberTitle = "Quantidade de pokemons"
            text.numberDescription = "20"
            text.typeTitle = "Tipo"
            text.typeDescription = "Fogo"
            text.centerTitle = "Descrição"
            text.centerDescription = "Estes Pokémon geralmente habitam regiões vulcânicas ou áreas de clima quente. Suas habilidades permitem que eles manipulem o fogo de diversas maneiras, tornando-os adversários formidáveis em batalha."
        case "waterType":
            imageName = "waterBackground"
            text.numberTitle = "Quantidade de pokemons"
            text.numberDescription = "20"
            text.typeTitle = "Tipo"
            text.typeDescription = "Água"
            text.centerTitle = "Descrição"
            text.centerDescription = "Além de serem excelentes nadadores, muitos têm a capacidade de respirar debaixo d'água e resistir a grandes pressões. Suas técnicas de combate são fluidas e eficientes, utilizando a água como uma extensão de seus próprios corpos."
        case "thunderType":
            imageName = "thunderBackground"
            text.numberTitle = "Quantidade de pokemons"
            text.numberDescription = "20"
            text.typeTitle = "Tipo"
            text.typeDescription = "Raio"
            text.centerTitle = "Descrição"
            text.centerDescription = "Vivem em áreas com tempestades frequentes ou em ambientes com alta concentração de energia elétrica. Suas habilidades elétricas são úteis tanto em combate quanto em situações de sobrevivência."
        case "leefType":
            imageName = "leefBackground"
            text.numberTitle = "Quantidade de pokemons"
            text.numberDescription = "20"
            text.typeTitle = "Tipo"
            text.typeDescription = "Grama"
            text.centerTitle = "Descrição"
            text.centerDescription = "São capazes de realizar fotossíntese, absorvendo energia solar para se fortalecerem. Suas habilidades podem incluir desde o crescimento rápido de plantas até o controle total da vegetação ao redor."
        case "ghostType":
            imageName = "shadowBackground"
            text.numberTitle = "Quantidade de pokemons"
            text.numberDescription = "20"
            text.typeTitle = "Tipo"
            text.typeDescription = "Fantasma"
            text.centerTitle = "Descrição"
            text.centerDescription = "São mestres em truques e ilusões, tornando-se difíceis de detectar e combater. Sua conexão com o mundo dos espíritos lhes dá uma aura misteriosa e um conjunto único de habilidades."
        default:
            break
        }
        
        return HomePokemonViewModel.DisplayBackground.Response.Success(image: imageName, text: text)
    }
}
