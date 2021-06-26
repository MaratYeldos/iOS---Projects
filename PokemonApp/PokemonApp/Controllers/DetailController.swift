//
//  DetailController.swift
//  PokemonApp
//
//  Created by Yeldos Marat on 26.06.2021.
//

import UIKit

class DetailController: UIViewController {
    
    @IBOutlet weak var imgView: ImageView!
    @IBOutlet weak var nameLB: UILabel!
    @IBOutlet weak var descriptionLB: UILabel!
    
    @IBOutlet weak var weightLB: UILabel!
    @IBOutlet weak var heightLB: UILabel!
    @IBOutlet weak var typeLB: UILabel!
    @IBOutlet weak var attackLB: UILabel!
    
    var pokemon: Pokemon!
    
    override func viewDidLoad() {
        super.viewDidLoad()

        imgView.fetchImage(with: pokemon.imageUrl)
        nameLB.text = pokemon.name
        descriptionLB.text = pokemon.description
        weightLB.text = "\(pokemon.weight!)"
        heightLB.text = "\(pokemon.height!)"
        typeLB.text = pokemon.type
        attackLB.text = "\(pokemon.attack!)"
        
    }
    
}
