//
//  CartViewController.swift
//  shopping app
//
//  Created by 謝環宇 on 12/6/16.
//  Copyright © 2016 Nina. All rights reserved.
//

import UIKit
private let reuseIdentifier = "Cell"



var itemNames :[String] = []
var imgNames :[String] = []


class CartViewController: UIViewController,UITableViewDataSource, UITableViewDelegate {
    
    var shoppingCart = Cart()

    override func viewDidLoad() {
        super.viewDidLoad()

        // Do any additional setup after loading the view.
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
    
    /*
    // MARK: - Navigation

    // In a storyboard-based application, you will often want to do a little preparation before navigation
    override func prepare(for segue: UIStoryboardSegue, sender: Any?) {
        // Get the new view controller using segue.destinationViewController.
        // Pass the selected object to the new view controller.
    }
    */

}
