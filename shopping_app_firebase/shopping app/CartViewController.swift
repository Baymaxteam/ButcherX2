//
//  CartViewController.swift
//  shopping app
//
//  Created by 謝環宇 on 12/6/16.
//  Copyright © 2016 Nina. All rights reserved.
//

import UIKit
import Firebase
private let reuseIdentifier = "Cell"

var itemNames = ["豬五花肉"]
var imgNames = ["豬五花肉.jpg"]

class CartViewController: UIViewController,UITableViewDataSource, UITableViewDelegate {

    var items: [CartOrderList] = []
    var userInfo: User!
    
    override func viewDidLoad() {
        super.viewDidLoad()

        // Do any additional setup after loading the view.
        FIRAuth.auth()!.addStateDidChangeListener() { auth, user in
            if user != nil {
                print("Account : User log in")
                print(user!.email!)
                self.userInfo = User(authData: user!)
            }
        }
        

    }

    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
        // Dispose of any resources that can be recreated.
    }
    
    func numberOfSections(in tableView: UITableView) -> Int {
        // #warning Incomplete implementation, return the number of sections
        return 1
    }
    
    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        // #warning Incomplete implementation, return the number of rows
        return itemNames.count
    }
    
    
    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        let cell = tableView.dequeueReusableCell(withIdentifier: reuseIdentifier, for: indexPath) as! CartTableViewCell
        
        // Configure the cell...
        cell.cartNameLabel.text = itemNames[0]
        cell.cartImageView.image = UIImage(named: imgNames[0])

        //cell.imageView?.layer.borderWidth = 30
        return cell
    }
    @IBAction func sendButtonDidTouch(_ sender: AnyObject) {
        // Creating a Connection to Firebase
        let ref = FIRDatabase.database().reference(withPath: "order-items")
        let text = "order_test"
//        let userEmail = "qq@gmail.com"
//        let orderTime = "2016/12/2-18:09"
        let orderTime =  String(describing: NSDate())
        let orderPrice = 1233 as Int
        var orderItems = [String: Int]()
        orderItems["豬肉"] = 3
        orderItems["香腸"] = 10
        print(orderItems)
        
        let alert = UIAlertController(title: "送出訂單",
                                      message: nil,
                                      preferredStyle: .alert)
        
        let saveAction = UIAlertAction(title: "確認",style: .default) { _ in
            let cartOrderList = CartOrderList(orderByUser: self.userInfo.email , orderByTime: orderTime, orderByPrice: orderPrice, orderByItemAndNumber: orderItems)
            let cartOrderListRef = ref.child(text.lowercased())
            cartOrderListRef.setValue(cartOrderList.toAnyObject())
            print(cartOrderList.toAnyObject())
        }
        
        let cancelAction = UIAlertAction(title: "取消",
                                         style: .default)
        alert.addAction(saveAction)
        alert.addAction(cancelAction)
        
        present(alert, animated: true, completion: nil)
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
