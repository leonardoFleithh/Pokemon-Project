//
//  HomePokemonViewController.swift
//  PokemonProject - UIKit
//
//  Created by Leonardo on 08/05/24.
//

import UIKit
import SnapKit

class HomePokemonViewController: UIViewController, CodedView {
    
    //MARK: var's
    let interactor: HomePokemonInteractor
    let coordinator: (Coordinator & HomePokemonCoordinatable)?
    let headerView = HeaderPokemonView()
    
    init(interactor: HomePokemonInteractor, coordinator: (Coordinator & HomePokemonCoordinatable)?) {
        self.interactor = interactor
        self.coordinator = coordinator
        super.init(nibName: nil, bundle: nil)
    }
    
    required init?(coder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }
    
    //MARK: View Lifecycle
    override func viewDidAppear(_ animated: Bool) {
        let request = HomePokemonViewModel.GetData.Request()
        interactor.fetchPokemons(request)
    }
    
    override func viewDidLoad() {
        super.viewDidLoad()
        setupView()
        configureNavItems()
        
        interactor.setImageBackground(HomePokemonViewModel.DisplayBackground.Request())
        
    }
    
    //MARK: Setup Views
    func setupView() {
        setupHierarchy()
        setupConstraints()
    
    }
    
    func setupHierarchy() {
        view.addSubview(headerView)
    }
    
    func setupConstraints() {
        
        headerView.snp.makeConstraints { make in
            make.top.leading.trailing.bottom.equalToSuperview()
        }
    }
    
    //MARK: Func's
    private func configureNavItems() {
        self.navigationItem.rightBarButtonItem = UIBarButtonItem(image: UIImage(named: "pokeball-icon"),
                                                                 style: .plain,
                                                                 target: self,
                                                                 action: nil)
        
        self.navigationController?.navigationBar.prefersLargeTitles = true
    }
}
