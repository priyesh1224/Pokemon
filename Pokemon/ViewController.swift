//
//  ViewController.swift
//  Pokemon
//
//  Created by PRIYESH  on 07/03/17.
//  Copyright © 2017 PRIYESH . All rights reserved.
//

import UIKit
import AVFoundation

class ViewController: UIViewController,UICollectionViewDataSource,UICollectionViewDelegate,UICollectionViewDelegateFlowLayout ,UISearchBarDelegate {

    @IBOutlet weak var search: UISearchBar!
    @IBOutlet weak var collection: UICollectionView!
    var array = [poke]()
    var filter = [poke]()
    var musicplayer : AVAudioPlayer!
    var f : Int = 0
    var selectedpoke : poke!
    var searchinprogress = false
    override func viewDidLoad() {
        super.viewDidLoad()
        collection.delegate = self
        collection.dataSource = self
        search.delegate = self
        search.returnKeyType = .done
        parsecsv()
        
    }
    func parsecsv() {
        
        let path = Bundle.main.path(forResource: "pokemon", ofType: "csv")!
        do {
            let csv = try CSV(contentsOfURL: path)
            let rows = csv.rows
            for row in rows {
                let id = Int(row["id"]!)
                let name = row["identifier"]!
                let height = row["height"]!
                let be = row["base_experience"]!
                let new = poke(name: name, id: id!,height : height,be : be)
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
    func searchBarSearchButtonClicked(_ searchBar: UISearchBar) {
        view.endEditing(true)
    }
    
    func collectionView(_ collectionView: UICollectionView, numberOfItemsInSection section: Int) -> Int {
        return searchinprogress ? filter.count : array.count
    }
    func numberOfSections(in collectionView: UICollectionView) -> Int {
        return 1
    }
    func collectionView(_ collectionView: UICollectionView, didSelectItemAt indexPath: IndexPath) {
        
        selectedpoke  = searchinprogress ? filter[indexPath.row] : array[indexPath.row]
        
        print("1")
        performSegue(withIdentifier: "detail", sender: selectedpoke)
        print("2")

        
        
        
    }
    func collectionView(_ collectionView: UICollectionView, cellForItemAt indexPath: IndexPath) -> UICollectionViewCell {
        if let cell = collectionView.dequeueReusableCell(withReuseIdentifier: "cell", for: indexPath) as? Pokecell {
            if searchinprogress == false {
            cell.updatecell(pokemon: array[indexPath.row])
            }
            else {
                cell.updatecell(pokemon: filter[indexPath.row])
            }
            
            return cell
        }
            return Pokecell()
    }


    func searchBar(_ searchBar: UISearchBar, textDidChange searchText: String) {
        if search.text == nil || search.text == "" {
            searchinprogress = false
            self.collection.reloadData()
            searchBar.endEditing(true)
        }
        else {
            searchinprogress = true
            var lower = searchBar.text?.lowercased()
            filter = array.filter({($0.pokename.range(of : lower!) != nil)})
            self.collection.reloadData()
            
        }
    }
    
    
    
    
    override func prepare(for segue: UIStoryboardSegue, sender: Any?) {
       
        print("3")
            if segue.identifier == "detail" {
            if let detail = segue.destination as? DetailVC {
                print("4")

                if let newpoke = sender as? poke {
                    print("5")

                    detail.pokemon = selectedpoke
                }
            }
            
            
        }
    }
    
    
    
    }
   



