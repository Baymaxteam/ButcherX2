//
//  ItemViewController.swift
//  shopping app
//
//  Created by Che Nan Kuo on 2016/12/3.
//  Copyright © 2016年 Nina. All rights reserved.
//

import UIKit
import ChameleonFramework


class ItemViewController: UIViewController {

    override func viewDidLoad() {
        super.viewDidLoad()

        // Do any additional setup after loading the view.
        stepper.wraps = true
        stepper.autorepeat = true
        stepper.maximumValue = 10
    }

    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
        // Dispose of any resources that can be recreated.
    }
    

    /*
    // MARK: - Navigation

    // In a storyboard-based application, you will often want to do a little preparation before navigation
    override func prepare(for segue: UIStoryboardSegue, sender: Any?) {
        // Get the new view controller using segue.destinationViewController.
        // Pass the selected object to the new view controller.
    }
    */
    
    @IBOutlet weak var stepper: UIStepper!
    @IBOutlet weak var valueText: UITextField!
    
    @IBAction func stepperValueChange(_ sender: UIStepper) {
        print("value change!!")
        valueText.text = Int(sender.value).description
    }
}
