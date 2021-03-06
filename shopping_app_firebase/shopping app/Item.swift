//
//  Item.swift
//  shopping app
//
//  Created by 謝環宇 on 12/3/16.
//  Copyright © 2016 Nina. All rights reserved.
//

import Foundation

//定義商品類別的型態
class Item{
    var name = ""
    var img = ""
    var price = 0
    var unit = ""
    var description = ""
    var buynumber = 0
    //初始化類別
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
//定義購物車類別的型態
class Cart{
    var username = ""
    var email = ""
    var orderlist = [String: Item]()
    
    func deleteItem(by itemName: String) {
        orderlist.removeValue(forKey: itemName)
    }
    
    func updateItem(by itemName: String, value: Int) {
        orderlist[itemName]?.buynumber = value
    }
    
    func addItem(by item: Item) {
        //check if item is already exist
        if orderlist[item.name] != nil {
            orderlist[item.name]?.buynumber += item.buynumber
        }
        else{
            orderlist[item.name] = item
        }
    }
}

