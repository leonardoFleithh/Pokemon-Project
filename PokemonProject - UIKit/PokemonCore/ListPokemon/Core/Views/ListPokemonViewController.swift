//
//  ListPokemonViewController.swift
//  PokemonProject - UIKit
//
//  Created by Leonardo Campanher on 24/05/24.
//

import UIKit

class ListPokemonViewController: UIViewController, CodedView {

    //MARK: Var's
    let interactor: ListPokemonInteractor
    let coordinator: (ListPokemonCoordinator & ListPokemonCoordinatable)?
    
    init(interactor: ListPokemonInteractor, coordinator: (ListPokemonCoordinator & ListPokemonCoordinatable)?) {
        self.interactor = interactor
        self.coordinator = coordinator
        super.init(nibName: nil, bundle: nil)
    }
    
    required init?(coder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }
    
    //MARK: Lifecycle
    override func viewDidLoad() {
        super.viewDidLoad()
        setupView()

    }
    
    //MARK: CodedView
    func setupView() {
        setupHierarchy()
        setupConstraints()
    }
    
    func setupHierarchy() {
        
    }
    
    func setupConstraints() {
        
    }
    
    //MARK: Func's
    
}
