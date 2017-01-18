//
//  CartTableViewCell.swift
//  shopping app
//
//  Created by 謝環宇 on 12/6/16.
//  Copyright © 2016 Nina. All rights reserved.
//

import UIKit

class CartTableViewCell: UITableViewCell{
    @IBOutlet var cartImageView: UIImageView!
    @IBOutlet var cartNameLabel: UILabel!
    @IBOutlet var cartNumberLabel: UILabel!

    @IBOutlet weak var cartPriceLabel: UILabel!
    @IBOutlet weak var cartTotalPriceLabel: UILabel!
    @IBOutlet weak var stepper: UIStepper!
    
    // 點擊按鈕+-的CallBack Function 
    @IBAction func stepperValueChanged(_ sender: UIStepper) {
        cartNumberLabel.text = "數量: " + Int(sender.value).description // 更新Labbel顯示
        let item = shoppingCart.orderlist[cartNameLabel.text!]
        cartTotalPriceLabel.text = (Int(sender.value) * (item?.price)!).description  // 更新Labbel顯示
        shoppingCart.updateItem(by: cartNameLabel.text!, value: Int(sender.value))  // 更新購物車裡的物件
    }

}
