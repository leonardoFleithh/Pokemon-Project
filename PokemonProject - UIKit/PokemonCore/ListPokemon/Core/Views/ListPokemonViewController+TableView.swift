//
//  ListPokemonViewController+TableView.swift
//  PokemonProject - UIKit
//
//  Created by Leonardo Campanher on 29/05/24.
//

import Foundation
import UIKit

extension ListPokemonViewController: UITableViewDataSource, UITableViewDelegate {
    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        return pokemonListViewModel?.images.count ?? 0
    }
    
    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        guard let cell = tableView.dequeueReusableCell(withIdentifier: ListPokemonViewCell.identifier, for: indexPath) as? ListPokemonViewCell else {
            return UITableViewCell()
        }
        
        if pokemonListViewModel != nil {
            let images = pokemonListViewModel?.images[indexPath.row] ?? "placeholder"
            let names = pokemonListViewModel?.names[indexPath.row] ?? "no name"
            
            cell.configureCell(image: images, pokemonName: names)
        }
        
        return cell
    }
    
    func tableView(_ tableView: UITableView, heightForRowAt indexPath: IndexPath) -> CGFloat {
        return 100
    }
}

