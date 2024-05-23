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
    func setupBackImage()
}

extension Coordinator {
    func setupBackImage() {
        guard let backImage = UIImage(named: "angleLeft") else {
            print("Image not found")
            return
        }
        self.navigationController.navigationBar.backIndicatorImage = backImage
        self.navigationController.navigationBar.backIndicatorTransitionMaskImage = backImage
        self.navigationController.navigationBar.backItem?.title = nil
    }
}
