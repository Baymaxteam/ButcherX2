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
    @IBOutlet weak var stepper: UIStepper!
    @IBOutlet weak var itemPriceLabel: UILabel!
    @IBOutlet weak var itemTotalPriceLabel: UILabel!
    

    @IBAction func stepperValueChanged(_ sender: UIStepper) {
        cartNumberTF.text = Int(sender.value).description
    }
}
