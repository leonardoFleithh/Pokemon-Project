//
//  HomePokemonViewController+CollectionView.swift
//  PokemonProject - UIKit
//
//  Created by Leonardo Campanher on 15/05/24.
//

import Foundation
import UIKit

extension HomePokemonViewController: UICollectionViewDataSource, UICollectionViewDelegate, UICollectionViewDelegateFlowLayout {
    
    func collectionView(_ collectionView: UICollectionView, numberOfItemsInSection section: Int) -> Int {
        return 10
    }
    
    func collectionView(_ collectionView: UICollectionView, cellForItemAt indexPath: IndexPath) -> UICollectionViewCell {
        guard let cell = collectionView.dequeueReusableCell(withReuseIdentifier: PokemonCollectionViewCell.identifier, for: indexPath) as? PokemonCollectionViewCell
        else { return UICollectionViewCell() }
        
        cell.configureCard()
        return cell
    }
    
    func collectionView(_ collectionView: UICollectionView, layout collectionViewLayout: UICollectionViewLayout, sizeForItemAt indexPath: IndexPath) -> CGSize {
            
       let size = (self.view.frame.width/2) - 6 /// 6  = (espacing (12) x número de espaços entre as cells (1))  / número de cells por linha (2)
            
       return CGSize(width: size * 0.80, height: size * 0.80)
            
    }
    
    func collectionView(_ collectionView: UICollectionView, layout collectionViewLayout: UICollectionViewLayout, minimumLineSpacingForSectionAt section: Int) -> CGFloat {
        return 12
    }
}
