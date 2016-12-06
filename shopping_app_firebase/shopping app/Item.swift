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
    var buynumber = 0
    
    init(name:String, img:String, price:Int, unit:String, description:String, buynumber:Int)
    {
        self.name = name
        self.img = img
        self.price = price
        self.unit = unit
        self.description = description
        self.buynumber = buynumber
    }
}

class cart{
    var username = ""
    var orderlist = ["name": ""]
    init(username:String)
    {
        self.username = username
    }
}
