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
    
    


}
