//
//  Poke.swift
//  Pokemon
//
//  Created by PRIYESH  on 07/03/17.
//  Copyright © 2017 PRIYESH . All rights reserved.
//

import Foundation
class poke {
    
    var _pokename : String!
    var _pokeid : Int!
    var pokename : String {
        if _pokename == nil {
            _pokename = ""
        }
        return _pokename
    }
    var pokeid : Int {
        if _pokeid == nil {
            _pokeid = 0
        }
        return _pokeid
    }
    init(name : String , id : Int)
    {
        self._pokeid = id
        self._pokename = name
    }
    
    
}
