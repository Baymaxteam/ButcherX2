//
//  ItemStruct.swift
//  shopping app
//
//  Created by Che Nan Kuo on 2016/12/3.
//  Copyright © 2016年 Nina. All rights reserved.
//

import Foundation


struct Item {
    var itemName = ""
    var imageName = ""
    var description = ""
    var price = 0
    var quantity = 0
}


var ItemArray = [Item(itemName: "豬五花肉", imageName: "豬五花肉.jpg", description: "肥滋滋的五花肉", price: 100, quantity: 0),
                 Item(itemName: "豬肉香腸", imageName: "豬肉香腸.jpg", description: "新Ｘ羊", price: 250, quantity: 0),
                 Item(itemName: "豬肋排", imageName: "豬肋排.jpg", description: "碳烤ＢＢＱ", price: 300, quantity: 0),
                 Item(itemName: "沙朗牛", imageName: "沙朗牛.jpg", description: "美國嚴選", price: 400, quantity: 0),
                 Item(itemName: "雞蛋", imageName: "雞蛋.jpg", description: "產自於優質放山雞", price: 10, quantity: 0),
                 Item(itemName: "雞胸肉", imageName: "雞胸肉.jpg", description: "已清理，方便使用", price: 130, quantity: 0),
                 Item(itemName: "雞腿肉", imageName: "雞腿肉.jpg", description: "精選放山雞，絕對結實", price: 140, quantity: 0),
                 Item(itemName: "青蔥", imageName: "青蔥.jpg", description: "來自宜蘭三星", price: 100, quantity: 0),
                 Item(itemName: "高麗菜", imageName: "高麗菜.jpg", description: "高山，甜脆可口", price: 20, quantity: 0),
                 Item(itemName: "蒜頭", imageName: "蒜頭.jpg", description: "雲林直運", price: 50, quantity: 0)]
