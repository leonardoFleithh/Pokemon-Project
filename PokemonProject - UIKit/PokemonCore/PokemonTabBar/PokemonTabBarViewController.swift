//
//  PokemonTabBarViewController.swift
//  PokemonProject - UIKit
//
//  Created by Leonardo on 08/05/24.
//

import UIKit

class PokemonTabBarViewController: UITabBarController {

    override func viewDidLoad() {
        super.viewDidLoad()
        setupView()
    }
    
    private func setupView() {
        
        let home = UINavigationController(rootViewController: HomePokemonViewController())
        let berries = UINavigationController(rootViewController: HomePokemonViewController())
        
        let vcs: [UIViewController] = [home, berries]
        
        for vc in vcs {
            vc.navigationItem.largeTitleDisplayMode = .automatic
        }
        
        home.tabBarItem = UITabBarItem(title: "Pokemon", image: UIImage(systemName: "bird.circle.fill"), tag: 1)
        berries.tabBarItem = UITabBarItem(title: "Berries", image: UIImage(systemName: "camera.macro.circle.fill"), tag: 2)
        
        setViewControllers(vcs, animated: true)
        
    }
}
