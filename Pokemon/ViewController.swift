//
//  ViewController.swift
//  Pokemon
//
//  Created by PRIYESH  on 07/03/17.
//  Copyright © 2017 PRIYESH . All rights reserved.
//

import UIKit
import AVFoundation

class ViewController: UIViewController,UICollectionViewDataSource,UICollectionViewDelegate,UICollectionViewDelegateFlowLayout {

    @IBOutlet weak var collection: UICollectionView!
    var array = [poke]()
    var musicplayer : AVAudioPlayer!
    var f : Int = 0
    override func viewDidLoad() {
        super.viewDidLoad()
        collection.delegate = self
        collection.dataSource = self
        
        parsecsv()
        
    }
    func parsecsv() {
        
        let path = Bundle.main.path(forResource: "pokemon", ofType: "csv")!
        do {
            let csv = try CSV(contentsOfURL: path)
            let rows = csv.rows
            print(rows)
            for row in rows {
                let id = Int(row["id"]!)
                let name = row["identifier"]!
                let new = poke(name: name, id: id!)
                self.array.append(new)
            }
        } catch let err as NSError {
            print(err.debugDescription)
        }
    }
    
    
    
    @IBAction func musicbtnpressed(_ sender: Any) {
        if f == 0 {
        let path = Bundle.main.path(forResource: "music", ofType: "mp3")!
        do {
            musicplayer = try AVAudioPlayer(contentsOf: URL(string: path)!)
            musicplayer.prepareToPlay()
            musicplayer.numberOfLoops = -1
            musicplayer.play()
            f = 1
        } catch let err as NSError {
            print(err.debugDescription)
        }
        }
        else{
            musicplayer.pause()
            f = 0
        }
        
    }
    
    func collectionView(_ collectionView: UICollectionView, numberOfItemsInSection section: Int) -> Int {
        return array.count
    }
    func numberOfSections(in collectionView: UICollectionView) -> Int {
        return 1
    }
    func collectionView(_ collectionView: UICollectionView, didSelectItemAt indexPath: IndexPath) {
        print("")
    }
    func collectionView(_ collectionView: UICollectionView, cellForItemAt indexPath: IndexPath) -> UICollectionViewCell {
        if let cell = collectionView.dequeueReusableCell(withReuseIdentifier: "cell", for: indexPath) as? Pokecell {
                cell.updatecell(pokemon: array[indexPath.row])
            
            return cell
        }
            return Pokecell()
    }


   

}

