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
    @IBOutlet weak var stepper: UIStepper!
    @IBOutlet weak var itemQuantityText: UITextField!
    
    var item:Item!

    override func viewDidLoad() {
        super.viewDidLoad()

        // Do any additional setup after loading the view.
        itemIamgeView.image = UIImage(named: item.img)
        itemNameView.text = item.name
        let theStringValue :String = String(item.price)
        itemPriceView.text = "Price: "+theStringValue+" /"+item.unit
        itemdescriptionView.text = item.description
        
        // Stepper Setting
        stepper.wraps = true
        stepper.autorepeat = true
        stepper.maximumValue = 50
        itemQuantityText.text = "0"
    }

    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
        // Dispose of any resources that can be recreated.
    }


    @IBAction func changeItemQuantity(_ sender: UIStepper) {
        itemQuantityText.text = Int(sender.value).description
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
