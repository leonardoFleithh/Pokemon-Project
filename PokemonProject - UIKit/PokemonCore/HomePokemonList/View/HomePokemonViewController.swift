//
//  HomePokemonViewController.swift
//  PokemonProject - UIKit
//
//  Created by Leonardo on 08/05/24.
//

import UIKit
import SnapKit

protocol HomePokemonViewControllerDisplayLogic {
    
}

class HomePokemonViewController: UIViewController, CodedView {
    
    let pokemonCard = PokeCard()
    let service = PokemonService.shared
    
    private lazy var collectionView: UICollectionView = {
        let layout = UICollectionViewFlowLayout()
        layout.scrollDirection = .vertical
        let collection = UICollectionView(frame: .zero, collectionViewLayout: layout)
        collection.register(PokemonCollectionViewCell.self, forCellWithReuseIdentifier: PokemonCollectionViewCell.identifier)
        collection.contentInset = .init(top: 40, left: 25, bottom: 20, right: 25)
        collection.dataSource = self
        collection.delegate = self
        collection.backgroundColor = .blue
        return collection
    }()
        
    override func viewDidLoad() {
        super.viewDidLoad()
        setupView()
        
        pokemonCard.configure(image: UIImage(named: "pikachu"), title: "Pikachu", subtitle: "Raio")
        
        PokemonService.shared.fetchPokemon(request: .init(endpoint: .pokemon, path: ["?offset=0&limit=151"]), type: Pokemon.self) { result in
            switch result {
            case .success(let data):
                print(String(describing: data))
            case .failure(let error):
                print(String(describing: error))
            }
        }
    }
    
    func setupView() {
        setupHierarchy()
        setupConstraints()
        
        view.backgroundColor = .systemRed
    }
    
    func setupHierarchy() {
        view.addSubview(pokemonCard)
        view.addSubview(collectionView)
    }
    
    func setupConstraints() {
        pokemonCard.snp.makeConstraints { make in
            make.edges.equalTo(view.snp.edges).inset(UIEdgeInsets(top: 70, left: 20, bottom: 500, right: 20))
        }
        
        collectionView.snp.makeConstraints { make in
            make.top.equalTo(pokemonCard.snp.bottom).offset(24)
            make.leading.equalToSuperview()
            make.trailing.equalToSuperview()
            make.bottom.equalTo(view.safeAreaLayoutGuide)
            
        }
    }
}
