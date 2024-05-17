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
    let service = PokemonService.shared
    
    private lazy var collectionView: UICollectionView = {
        let layout = UICollectionViewFlowLayout()
        layout.scrollDirection = .vertical
        let collection = UICollectionView(frame: .zero, collectionViewLayout: layout)
        collection.register(PokemonCollectionViewCell.self, forCellWithReuseIdentifier: PokemonCollectionViewCell.identifier)
        collection.register(HeaderHomePokemonCollectionViewCell.self, forSupplementaryViewOfKind: UICollectionView.elementKindSectionHeader, withReuseIdentifier: HeaderHomePokemonCollectionViewCell.identifier)
        collection.dataSource = self
        collection.delegate = self
        collection.backgroundColor = .blue
        return collection
    }()
        
    override func viewDidLoad() {
        super.viewDidLoad()
        setupView()
        
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
        view.addSubview(collectionView)
    }
    
    func setupConstraints() {
        
        collectionView.snp.makeConstraints { make in
            make.top.equalToSuperview()
            make.leading.equalToSuperview()
            make.trailing.equalToSuperview()
            make.bottom.equalTo(view.safeAreaLayoutGuide)
            
        }
    }
}
