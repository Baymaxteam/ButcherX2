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
    
    @IBAction func stepperValueChanged(_ sender: UIStepper) {
        cartNumberLabel.text = "數量: " + Int(sender.value).description
        let item = shoppingCart.orderlist[cartNameLabel.text!]
        cartTotalPriceLabel.text = (Int(sender.value) * (item?.price)!).description
        shoppingCart.updateItem(by: cartNameLabel.text!, value: Int(sender.value))
    }

}
