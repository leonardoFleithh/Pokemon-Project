//
//  ListPokemonViewController.swift
//  PokemonProject - UIKit
//
//  Created by Leonardo Campanher on 24/05/24.
//

import SwiftUI
import UIKit

class ListPokemonViewController: UIViewController, CodedView {

    //MARK: Var's
    let interactor: ListPokemonInteractor
    let coordinator: (ListPokemonCoordinator & ListPokemonCoordinatable)?
    
    var pokemonListViewModel: ListPokemonViewModel.GetPokemons.ViewModel.Success?
    
    init(interactor: ListPokemonInteractor, coordinator: (ListPokemonCoordinator & ListPokemonCoordinatable)?) {
        self.interactor = interactor
        self.coordinator = coordinator
        super.init(nibName: nil, bundle: nil)
    }
    
    required init?(coder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }
    
    lazy var tableview: UITableView = {
        let table = UITableView()
        table.backgroundColor = .clear
        table.separatorStyle = .none
        table.register(ListPokemonViewCell.self, forCellReuseIdentifier: ListPokemonViewCell.identifier)
        table.dataSource = self
        table.delegate = self
        return table
    }()
    
    //MARK: Lifecycle
    override func viewDidLoad() {
        super.viewDidLoad()
        view.backgroundColor = .secondarySystemBackground
        title = "Pokemon List"
        setupView()
        
        Task {
            try await self.fetchPokemonList()
        }
    }
    
    //MARK: CodedView
    func setupView() {
        setupHierarchy()
        setupConstraints()
    }
    
    func setupHierarchy() {
        view.addSubview(tableview)
    }
    
    func setupConstraints() {
        tableview.snp.makeConstraints { make in
            make.top.equalTo(view.safeAreaLayoutGuide.snp.top)
            make.leading.equalToSuperview().offset(16)
            make.trailing.equalToSuperview().inset(16)
            make.bottom.equalTo(view.safeAreaLayoutGuide.snp.bottom)
        }
    }
    
    //MARK: Func's
    private func fetchPokemonList() async throws {
        try await self.interactor.fetchImagesForPokemon(.init())
    }
}
