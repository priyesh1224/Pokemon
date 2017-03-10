//
//  DetailVC.swift
//  Pokemon
//
//  Created by PRIYESH  on 07/03/17.
//  Copyright © 2017 PRIYESH . All rights reserved.
//

import UIKit

class DetailVC: UIViewController {
    var pokemon : poke!
    @IBOutlet weak var name: UILabel!
    @IBOutlet weak var id: UILabel!
    @IBOutlet weak var height: UILabel!
    @IBOutlet weak var baseexp: UILabel!
    @IBOutlet weak var image: UIImageView!
    override func viewDidLoad() {
        super.viewDidLoad()
        name.text = pokemon.pokename
        id.text = "\(pokemon.pokeid)"
        image.image = UIImage(named: "\(pokemon.pokeid)")
        height.text = pokemon.hei
        baseexp.text = pokemon.be
        
    
        
        // Do any additional setup after loading the view.
    }

    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
        // Dispose of any resources that can be recreated.
    }
    

    /*
    // MARK: - Navigation

    // In a storyboard-based application, you will often want to do a little preparation before navigation
    override func prepare(for segue: UIStoryboardSegue, sender: Any?) {
        // Get the new view controller using segue.destinationViewController.
        // Pass the selected object to the new view controller.
    }
    */

}
