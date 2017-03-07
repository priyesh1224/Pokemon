//
//  Pokecell.swift
//  Pokemon
//
//  Created by PRIYESH  on 07/03/17.
//  Copyright © 2017 PRIYESH . All rights reserved.
//

import UIKit

class Pokecell: UICollectionViewCell {
    
    @IBOutlet weak var img: UIImageView!
    @IBOutlet weak var name: UILabel!
    
    func updatecell(pokemon : poke) {
        self.img.image = UIImage(named: "\(pokemon.pokeid)")
        self.name.text = pokemon.pokename
    }
    
}
