//
//  MainCollectionViewController.swift
//  PokemonApp
//
//  Created by Yeldos Marat on 15.06.2021.
//

import UIKit

class MainCollectionViewController: UICollectionViewController {
    
    var pokemons = [Pokemon]()
    var indx = 0
    var tg = 0
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
        fetchPokemon()
        print(pokemons)
    }
    
    // MARK: UICollectionViewDataSource
    
    override func collectionView(_ collectionView: UICollectionView, numberOfItemsInSection section: Int) -> Int {
        // #warning Incomplete implementation, return the number of items
        return pokemons.count
    }
    
    override func collectionView(_ collectionView: UICollectionView, cellForItemAt indexPath: IndexPath) -> UICollectionViewCell {
        let cell = collectionView.dequeueReusableCell(withReuseIdentifier: "Cell", for: indexPath) as! MainCell
        
        // Configure the cell
        
        let pokemon = pokemons[indexPath.item]
        cell.configure(with: pokemon, indx: indexPath)
        
        
        return cell
    }
    
    override func prepare(for segue: UIStoryboardSegue, sender: Any?) {
        guard let detailVC = segue.destination as? DetailController else {return}
        let cell = sender as! UICollectionViewCell
        let indexPath = self.collectionView!.indexPath(for: cell)
        detailVC.pokemon = pokemons[indexPath!.item]
    }
    
    
    //MARK: - API
    func fetchPokemon() {
        Service.share.fetchData { (pokemon) in
            DispatchQueue.main.async {
                self.pokemons = pokemon
                self.collectionView.reloadData()
            }
        }
    }
    
}
