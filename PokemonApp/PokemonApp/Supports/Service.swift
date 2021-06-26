//
//  Service.swift
//  PokemonApp
//
//  Created by Yeldos Marat on 18.06.2021.
//

import UIKit

class Service: UIViewController {
    
    static let share = Service()
    var url = "https://pokedex-bb36f.firebaseio.com/pokemon.json"
    
    func fetchData(completion: @escaping ([Pokemon]) -> ()) {
        
        var pokemonArray = [Pokemon]()
        
        guard let url1 = URL(string: url) else {return}
        
        URLSession.shared.dataTask(with: url1) { (data, response, error) in
            
            if let error = error {
                print("Failed to fetch data with error: ", error.localizedDescription)
                return
            }
            
            
            guard let data = data else {return}
            
            do {
                guard let pokemons2 = try JSONSerialization.jsonObject(with: data, options: []) as? [AnyObject] else {return}
                
                for (key, result) in pokemons2.enumerated() {
                    if let dict = result as? [String:AnyObject] {
                        let pokemon = Pokemon(id: key, dictionary: dict)
                        pokemonArray.append(pokemon)
                        
                        pokemonArray.sort { (poke1, poke2) -> Bool in
                            return poke1.id! < poke2.id!
                        }
                    }
                    completion(pokemonArray)
                }
                
            } catch let error{
                print(error.localizedDescription)
            }
        }.resume()
    }
    
}
