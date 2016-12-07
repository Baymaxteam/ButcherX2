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
    @IBOutlet weak var stpper: UIStepper!
    
   
    var item:Item!

    override func viewDidLoad() {
        super.viewDidLoad()

        // Do any additional setup after loading the view.
        itemIamgeView.image = UIImage(named: item.img)
        itemNameView.text = item.name
        let theStringValue :String = String(item.price)
        itemPriceView.text = "價錢: "+theStringValue+" /"+item.unit
        itemdescriptionView.text = item.description
        itemNumberTF.text = "0"
        
        stpper.wraps = true
        stpper.autorepeat = true
        stpper.maximumValue = 10
    }

    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
        // Dispose of any resources that can be recreated.
    }
    
    
    override func touchesEnded(_ touches: Set<UITouch>, with event: UIEvent?) {
        itemNumberTF.resignFirstResponder()
        //item.buynumber = Int(itemNumberTF.text!)!
        //stpper.value = Double(itemNumberTF.text!)!
        
    }
    
    
    
    @IBAction func addButtonClick(_ sender: UIButton) {
        shoppingCart.addItem(by: item)
        print(item.name)
    }
    
    @IBAction func stepperValueChange(_ sender: UIStepper) {
        itemNumberTF.text = Int(sender.value).description
        item.buynumber = Int(sender.value)
        //print(item.buynumber)
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
