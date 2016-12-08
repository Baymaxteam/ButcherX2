//
//  TabBarController.swift
//  shopping app
//
//  Created by Nina on 2016/12/7.
//  Copyright © 2016年 Nina. All rights reserved.
//

import UIKit

class TabBarController: UITabBarController {

    override func viewDidLoad() {
        super.viewDidLoad()
        self.tabBar.tintColor = UIColor.init(red: 0/255, green: 64/255, blue: 128/255, alpha: 1)
        UITabBarItem.appearance().setTitleTextAttributes([NSForegroundColorAttributeName: UIColor.white], for: .normal)
        UITabBarItem.appearance().setTitleTextAttributes([NSForegroundColorAttributeName:UIColor.init(red: 0/255, green: 64/255, blue: 128/255, alpha: 1)], for: .selected)
        self.tabBar.unselectedItemTintColor = UIColor.white
        // Do any additional setup after loading the view.
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

}
