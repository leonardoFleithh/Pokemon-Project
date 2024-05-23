//
//  PokemonLaunchScreenViewController.swift
//  PokemonProject - UIKit
//
//  Created by Leonardo Campanher on 20/05/24.
//

import Foundation
import UIKit

final class PokemonLaunchScreenViewController: UIViewController {
    
    private var isAnimate: Bool = false {
        didSet {
            if isAnimate {
                UIView.animate(withDuration: 3) {
                    self.pokeballIcon.frame = CGRect(x: 0, y: 0, width: 60, height: 60)
                    self.pokeballIcon.layer.position.y = 3.0
                }
            }
        }
    }
    
    @IBOutlet weak var pokeballIcon: UIImageView!
    
    override func viewDidLoad() {
        super.viewDidLoad()
        isAnimate.toggle()
    }
}
