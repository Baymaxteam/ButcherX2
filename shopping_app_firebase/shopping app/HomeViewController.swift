//
//  HomeViewController.swift
//  shopping app
//
//  Created by 謝環宇 on 12/3/16.
//  Copyright © 2016 Nina. All rights reserved.
//

import UIKit
private let reuseIdentifier = "Cell"

class HomeViewController: UIViewController, UICollectionViewDataSource, UICollectionViewDelegate {

    var itemNames = ["豬五花肉", "豬肉香腸", "豬肋排", "沙朗牛", "雞蛋", "雞胸肉", "雞腿肉", "青蔥", "高麗菜", "蒜頭"]
    var imgNames = ["豬五花肉.jpg", "豬肉香腸.jpg", "豬肋排.jpg", "沙朗牛.jpg", "雞蛋.jpg", "雞胸肉.jpg", "雞腿肉.jpg", "青蔥.jpg", "高麗菜.jpg", "蒜頭.jpg"]
    
    override func viewDidLoad() {
        super.viewDidLoad()

        // Do any additional setup after loading the view.
    }

    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
        // Dispose of any resources that can be recreated.
    }
    
    
    func collectionView(_ collectionView: UICollectionView, numberOfItemsInSection section: Int) -> Int {
        // #warning Incomplete implementation, return the number of items
        return itemNames.count
    }

    func collectionView(_ collectionView: UICollectionView, cellForItemAt indexPath: IndexPath) -> UICollectionViewCell {
        let cell = collectionView.dequeueReusableCell(withReuseIdentifier: reuseIdentifier, for: indexPath)as! HomeCollectionViewCell
        cell.nameLabel.text = itemNames[indexPath.row]
        cell.thumbnailImageView.image = UIImage(named: imgNames[indexPath.row])
        return cell

    }
    func collectionView(_ collectionView: UICollectionView, didSelectItemAt indexPath: IndexPath) {
        let itemImg = self.imgNames[indexPath.row]

        self.performSegue(withIdentifier: "itemImg", sender: itemImg)

    }

    override func prepare(for segue: UIStoryboardSegue, sender: Any?) {
        if segue.identifier == "itemImg"
        {
            let controller = segue.destination as!itemViewController
            controller.itemImage = sender as! String
        }

    }
    
    
    
//    override func prepare(for segue: UIStoryboardSegue, sender: Any?) {
//        if segue.identifier == "gotoItemPage"{
//            let indexPath = collectionView(UICollectionView, cellForItemAt: IndexPath){
//                let destinationController = segue.destination as! itemViewController
//                destinationController.itemImage = imgNames[indexPath.row]
//            }
//        }
//    }
    /*
    // MARK: - Navigation

    // In a storyboard-based application, you will often want to do a little preparation before navigation
    override func prepare(for segue: UIStoryboardSegue, sender: Any?) {
        // Get the new view controller using segue.destinationViewController.
        // Pass the selected object to the new view controller.
    }
    */

}
