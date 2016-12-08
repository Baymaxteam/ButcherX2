//
//  itemViewController.swift
//  shopping app
//
//  Created by 謝環宇 on 12/3/16.
//  Copyright © 2016 Nina. All rights reserved.
//

import UIKit

class itemViewController: UIViewController {
    @IBOutlet var itemIamgeView:UIImageView!
    @IBOutlet var itemNameView:UILabel!
    @IBOutlet var itemPriceView:UILabel!
    @IBOutlet var itemdescriptionView:UITextView!
    @IBOutlet var itemNumberLabel:UILabel!
    @IBOutlet weak var stepper: UIStepper!
    
    
    var item:Item!

    override func viewDidLoad() {
        super.viewDidLoad()

        // Do any additional setup after loading the view.
        itemIamgeView.image = UIImage(named: item.img)
        itemNameView.text = item.name
        let theStringValue: String = String(item.price)
        itemPriceView.text = "價格: " + item.unit + theStringValue + "元"
        itemdescriptionView.text = item.description
        stepper.wraps = true
        stepper.autorepeat = true
        stepper.maximumValue = 99
    }

    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
        // Dispose of any resources that can be recreated.
    }
    
    
    @IBAction func stepperValueChanged(_ sender: UIStepper) {
        itemNumberLabel.text = "數量: " + Int(sender.value).description
        item.buynumber = Int(sender.value)
    }
    
    
    @IBAction func addToCart(_ sender: Any) {
        shoppingCart.addItem(by: item)
    }

    /*
    // MARK: - Navigation

    // In a storyboard-based application, you will often want to do a little preparation before navigation
    override func prepare(for segue: UIStoryboardSegue, sender: Any?) {
        // Get the new view controller using segue.destinationViewController.
        // Pass the selected object to the new view controller.
    }
    */

}
