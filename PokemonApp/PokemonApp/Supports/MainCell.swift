//
//  MainCell.swift
//  PokemonApp
//
//  Created by Yeldos Marat on 15.06.2021.
//

import UIKit

class MainCell: UICollectionViewCell {
    
    @IBOutlet weak var imgView: ImageView!
    @IBOutlet weak var nameLabel: UILabel!
    
    func configure(with pokemon: Pokemon, indx: IndexPath) {
        self.nameLabel.text = pokemon.name
        
        self.imgView.fetchImage(with: pokemon.imageUrl)
        
    }
  
}
