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
    @IBOutlet var cartNumberTF: UITextField!
    @IBOutlet weak var stepper: UIStepper!
    @IBOutlet weak var itemPriceLabel: UILabel!
    @IBOutlet weak var itemTotalPriceLabel: UILabel!
    
    override func touchesEnded(_ touches: Set<UITouch>, with event: UIEvent?) {
        cartNumberTF.resignFirstResponder()
    }

    @IBAction func stepperValueChanged(_ sender: UIStepper) {
        cartNumberTF.text = Int(sender.value).description
    }
}
