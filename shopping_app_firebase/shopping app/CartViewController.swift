//
//  CartViewController.swift
//  shopping app
//
//  Created by 謝環宇 on 12/6/16.
//  Copyright © 2016 Nina. All rights reserved.
//

import UIKit


class CartViewController: UIViewController {
    

    var itemNames = ["豬五花肉"]
    var imgNames = ["豬五花肉.jpg"]
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
        return itemNames.count
    }
    
    
    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        let cell = tableView.dequeueReusableCell(withIdentifier: "Cell", for: indexPath) as! CartTableViewCell
        
        // Configure the cell...
        cell.cartNameLabel.text = itemNames[0]
        cell.cartImageView.image = UIImage(named: imgNames[0])
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
