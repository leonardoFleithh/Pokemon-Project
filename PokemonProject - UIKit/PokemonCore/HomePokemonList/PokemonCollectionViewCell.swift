//
//  PokemonCollectionViewCell.swift
//  PokemonProject - UIKit
//
//  Created by Leonardo Campanher on 16/05/24.
//

import UIKit

class PokemonCollectionViewCell: UICollectionViewCell {
    
    static let identifier = "id"
    
    private lazy var pokeCard = PokeCard()
    
    override func prepareForReuse() {
        self.pokeCard.configure(image: nil, title: "", subtitle: "")
    }
    
    public func configureCard() {
        self.pokeCard.configure(image: UIImage(named: "pikachu"), title: "Pikachu", subtitle: "Thunder")
        setupConstraints()
    }
    
    private func setupConstraints() {
        self.addSubviews(pokeCard)
        pokeCard.snp.makeConstraints { make in
            make.top.equalTo(self.snp.top).offset(0)
            make.bottom.equalTo(self.snp.bottom).offset(0)
            make.leading.equalTo(self.snp.leading).offset(0)
            make.trailing.equalTo(self.snp.trailing).offset(0)
        }
    }
}
