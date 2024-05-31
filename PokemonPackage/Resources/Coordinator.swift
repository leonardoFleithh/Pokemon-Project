//
//  Coordinator.swift
//  PokemonProject - UIKit
//
//  Created by Leonardo Campanher on 21/05/24.
//

import Foundation
import UIKit

protocol Coordinator {
    var navigationController: UINavigationController { get set }
    func start()
}
