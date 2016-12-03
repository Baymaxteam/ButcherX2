//
//  CartTableViewCell.swift
//  shopping app
//
//  Created by Nina on 2016/11/28.
//  Copyright © 2016年 Nina. All rights reserved.
//

import UIKit

class CartTableViewCell: UITableViewCell {
    
    override func awakeFromNib() {
        super.awakeFromNib()
        // Initialization code
    }

    override func setSelected(_ selected: Bool, animated: Bool) {
        super.setSelected(selected, animated: animated)

        // Configure the view for the selected state
    }
    @IBOutlet var thumbnailImageView: UIImageView!
    @IBOutlet var nameLabel: UILabel!
    @IBOutlet var numberTextField: UITextField!
    @IBOutlet var subTotalLabel: UILabel!
    @IBOutlet var itemPriceLabel: UILabel!
    
    @IBOutlet weak var stepper: UIStepper!
    

    @IBAction func stepperValueChange(_ sender: UIStepper) {
        numberTextField.text = Int(sender.value).description
        // get price(int) in string
        var priceString = itemPriceLabel.text //"Price: "
        let index = priceString?.index((priceString?.startIndex)!, offsetBy: 7)
        priceString = priceString?.substring(from: index!)

        subTotalLabel.text = "Total: " + String(Int(priceString!)!*Int(numberTextField.text!)!)
    }

}
