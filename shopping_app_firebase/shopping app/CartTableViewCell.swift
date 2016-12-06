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

    override func touchesEnded(_ touches: Set<UITouch>, with event: UIEvent?) {
        cartNumberTF.resignFirstResponder()
    }

}
