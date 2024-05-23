//
//  ChoosePokemonViewModel.swift
//  PokemonProject - UIKit
//
//  Created by Leonardo Campanher on 20/05/24.
//

import Foundation
import UIKit

enum PokemonResponseError: Error {
    case cannotLoadPokemonType
    case badURL
    case badServerResponse
    case imageDontExist
}

struct ChoosePokemonViewModel {
    struct Request {
        var image: String
    }
    struct Response {
        var image: String
    }
    enum ViewModel {
        struct Success {
            var image: String
        }
        struct Failure {
            let error: Error
        }
    }
}
