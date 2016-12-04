//
//  Item.swift
//  shopping app
//
//  Created by 謝環宇 on 12/3/16.
//  Copyright © 2016 Nina. All rights reserved.
//

import Foundation
class Item{
    var name = ""
    var img = ""
    var price = 0
    var unit = ""
    var description = ""
    
    init(name:String, img:String, price:Int, unit:String, description:String)
    {
        self.name = name
        self.img = img
        self.price = price
        self.unit = unit
        self.description = description
    }
}

class cart{
    var name = ""
    var img = ""
    var price = 0
    var unit = ""
    var number = 0
    
    init(name:String, img:String, price:Int, unit:String, number: Int)
    {
        self.name = name
        self.img = img
        self.price = price
        self.unit = unit
        self.number = number
    }
}
