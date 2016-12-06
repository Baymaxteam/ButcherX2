/
//  CartViewController.swift
//  shopping app
//
//  Created by 謝環宇 on 12/6/16.
//  Copyright © 2016 Nina. All rights reserved.
//

import UIKit
import Firebase
private let reuseIdentifier = "Cell"


var itemNames :[String] = []
var imgNames :[String] = []


class CartViewController: UIViewController,UITableViewDataSource, UITableViewDelegate {
    
    @IBOutlet weak var cartTableView: UITableView!
    var refreshControl: UIRefreshControl!

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

        refreshControl = UIRefreshControl()
        refreshControl.addTarget(self, action: #selector(refresh), for: .valueChanged)
        cartTableView.addSubview(refreshControl)
    }
    
    @objc func refresh() {
        print("refresh")
        cartTableView.reloadData()
        refreshControl.endRefreshing()
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
    
        return shoppingCart.orderlist.count
    }
    
    
    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        let cell = tableView.dequeueReusableCell(withIdentifier: reuseIdentifier, for: indexPath) as! CartTableViewCell
        
        
        // Configure the cell...
        let item_keys = Array(shoppingCart.orderlist.keys)
        let item = shoppingCart.orderlist[item_keys[indexPath.row]]
        cell.cartNameLabel.text = item?.name
        cell.cartImageView.image = UIImage(named: (item?.img)!)

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
